module ReposHelper

  def committer_name(commit)
    commit.commit.committer.name.titleize
  end

  def message(commit)
    commit.commit.message
  end

  def commit_date(commit)
    commit.commit.committer.date.to_datetime.strftime("%d %b %y %H:%M")
  end

end
