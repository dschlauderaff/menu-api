class JsonWebToken

  def self.encode(payload)
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end

  def self.decode(token)
    decoded_token = JWT.decode(token, Rails.application.credentials.secret_key_base).first
    HashWithIndifferentAccess.new(decoded_token)
  rescue
    nil #JWT throws error for null tokens
  end
end