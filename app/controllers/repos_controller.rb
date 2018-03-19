class ReposController < ApplicationController
  include GithubApi

  def index
    @repos = all_repos
  end

  def commits
    @repo = params[:repo]
    @commits = all_commits(params[:repo], params[:start], params[:end])
  end

end

