
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pago_efectivo_rest/version"

Gem::Specification.new do |spec|
  spec.name          = "pago_efectivo_rest"
  spec.version       = PagoEfectivoRest::VERSION
  spec.authors       = ["Giancarlo Solís"]
  spec.email         = ["gsolis@sperant.com"]

  spec.summary       = %q{REST client to connect with PagoEfectivo API}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/gcarlosc/pago_efectivo_rest"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.add_runtime_dependency "rest-client"
  spec.add_development_dependency "json"
end
