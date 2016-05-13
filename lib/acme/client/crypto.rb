class Acme::Client::Crypto
  attr_reader :private_key

  def initialize(private_key)
    @private_key = private_key
  end

  def generate_signed_jws(options)
    jwt = JSON::JWT.new(options[:payload] || {})
    jwt.header.merge!(options[:header] || {})
    jwt.header[:jwk] = jwk
    jwt.signature = jwt.sign(private_key, :RS256).signature
    jwt.to_json(syntax: :flattened)
  end

  def thumbprint
    jwk.thumbprint
  end

  def digest
    OpenSSL::Digest::SHA256.new
  end

  private

  def jwk
    @jwk ||= JSON::JWK.new(public_key)
  end

  def public_key
    @public_key ||= private_key.public_key
  end
end
