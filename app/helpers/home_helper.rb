module HomeHelper

  include UserHelper

  def profile_div()
    (content_tag :div, class: "profile-pic" do
      if current_user.profile_pic_url.present?
        (image_tag current_user.profile_pic_url, alt: "Profile Pic").to_s
      else
        (image_tag "default_profile_pic.png", alt: "Profile Pic").to_s
      end
    end).html_safe
  end

end
