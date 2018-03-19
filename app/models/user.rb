class User < ApplicationRecord

  devise :database_authenticatable, :registerable, :validatable, :omniauthable, omniauth_providers: %i[github]

  def self.from_omniauth(auth)
    info = auth.info
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = info.email
      user.name = info.name
      user.password = Devise.friendly_token[0,20]
      user.profile_pic_url = auth.info.image
    end
  end
end
