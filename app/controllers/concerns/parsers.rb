module Parsers

  module Omniauth

    def omniauth_response
      request.env["omniauth.auth"]
    end

    def followers
      omniauth_response.extra.raw_info.followers
    end

    def token
      omniauth_response.credentials.token
    end

    def github_username
      omniauth_response.info.nickname
    end

  end


end
