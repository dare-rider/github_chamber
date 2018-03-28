class ReposController < ApplicationController
  before_action :authenticate_user!
  include GithubApi

  def index
    @repos = all_repos
  end

  def commits
    @repo = params[:repo]
    @commits = all_commits(params[:repo], params[:start], params[:end])
    gon.commits = @commits
  end

end

