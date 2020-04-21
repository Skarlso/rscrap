# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'telegram/version'

Gem::Specification.new do |spec|
  spec.name          = "telegram"
  spec.version       = Telegram::VERSION
  spec.authors       = ["Ernst Rijsdijk"]
  spec.email         = ["macernst@gmail.com"]
  spec.summary       = "Telegram API"
  spec.description   = "Telegram API"
  spec.homepage      = "https://github.com/macernst/telegram"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
