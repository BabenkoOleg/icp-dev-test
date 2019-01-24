require 'jwt'

class Auth
  ALGORITHM = 'HS256'

  class << self
    def issue(payload, exp = Time.now.to_i + 4 * 3600)
      payload[:exp] = exp
      JWT.encode(payload, auth_secret, ALGORITHM)
    end

    def decode(token)
      JWT.decode(token, auth_secret, true, { algorithm: ALGORITHM }).first
    end

    def auth_secret
      Rails.application.credentials.jwt_secret
    end
  end
end
