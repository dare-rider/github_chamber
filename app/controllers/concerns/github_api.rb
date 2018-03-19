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
    github.repos.commits.list opts
  end

end
