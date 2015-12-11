# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inwx/version'

Gem::Specification.new do |spec|
  spec.name          = "inwx-rb"
  spec.version       = INWX::VERSION
  spec.authors       = ["Mathias Kaufmann","InterNetworX Ltd. & Co. KG"]
  spec.email         = ["me@stei.gr","info@inwx.de"]

  spec.summary       = %q{INWX XML-RPC client.}
  spec.description   = %q{INWX XML-RPC client.}
  spec.homepage      = "https://github.com/inwx/ruby-client"

  spec.files         = Dir['lib/   *.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
