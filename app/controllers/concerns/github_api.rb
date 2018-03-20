module GithubApi

  def github
    @github ||= Github.new oauth_token: session[:token]
  end

  def all_repos
    github.repos.list
  end

  def all_commits(repo, start_date, end_date)

    return [] if start_date.blank? && end_date.blank?

    opts = {user: session[:github_username], repo: repo}

    if start_date.present?
      opts[:since] = start_date.to_date.strftime('%Y-%m-%dT%H:%M:%SZ')
    end

    if end_date.present?
      opts[:until] = end_date.to_date.strftime('%Y-%m-%dT%H:%M:%SZ')
    end
    commits = github.repos.commits.list opts
    res = get_commits_filtered_data(commits)
  end

  private

    def get_commits_filtered_data(commits)
      out = []
      commits.each do|commit|
        commit_obj = {
          committer: committer_name(commit),
          message: message(commit),
          date: commit_date(commit),
          image_path: committer_image(commit)
        }
        out.push(commit_obj)
      end
      return out
    end

    def committer_name(commit)
      commit.commit.committer.name.titleize
    end

    def message(commit)
      commit.commit.message
    end

    def commit_date(commit)
      commit.commit.committer.date.to_datetime.strftime("%d %b %y %H:%M")
    end

    def committer_image(commit)
      commit.committer.avatar_url if commit.committer
    end

end
