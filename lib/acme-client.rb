require 'openssl'
module OpenSSL::PKey
  class EC # not in jRuby...
  end
end
require 'faraday'
require 'json'
require 'json/jwt'
require 'digest'
require 'forwardable'

module Acme; end

require 'acme/client'
require 'acme/client/certificate'
require 'acme/client/certificate_request'
require 'acme/client/self_sign_certificate'
require 'acme/client/crypto'
require 'acme/client/resources'
require 'acme/client/faraday_middleware'
require 'acme/client/error'
