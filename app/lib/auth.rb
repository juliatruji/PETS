require 'jwt'

class Auth
  ALGORITHM = 'HS256'.freeze

  def self.encode(payload)
    JWT.encode(payload, auth_secret, ALGORITHM)
  end

  def self.decode(token)
    JWT.decode(token, auth_secret, true, { algorithm: ALGORITHM }).first
  rescue JWT::DecodeError
    {}
  end

  def self.auth_secret
    Rails.env.development? ? "ea92b6728a57da63f7d8f4a7981d5a2324c348b78691ebae63e680decfb26a5e643bda028ec400586826bf5bc14cfc2315ed2f8f958ebd78bc1a2fae50a71ebd" : ENV["JWT_KEY_BASE"]
  end
end
