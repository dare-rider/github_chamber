class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Parsers::Omniauth

  before_action :set_or_create_user, only: [:github]

  def github
    set_session
    sign_in @user
    set_flash_message(:notice, :success, kind: "Githib")
    redirect_to root_path
  end

  def failure
    redirect_to root_path
  end

  private

    def set_or_create_user
      @user = User.from_omniauth(omniauth_response)
      redirect_to root_path, flash: { error: @user.errors.full_messages } if @user.errors.any?
    end

    def set_session
      session[:id] = @user.id
      session[:email] = @user.email
      session[:name] = @user.name
      session[:github_username] = github_username
      session[:token] = token
      session[:followers] = followers
    end
end
