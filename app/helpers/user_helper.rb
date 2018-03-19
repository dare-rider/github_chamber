module UserHelper

  def name
    current_user.name.titleize
  end

  def followers
    session[:followers]
  end

end
