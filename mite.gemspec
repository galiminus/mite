# -*- encoding: utf-8 -*-

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mite/version"

Gem::Specification.new do |gem|
  gem.name          = "mite"
  gem.version       = Mite::VERSION
  gem.authors       = ["Victor Goya"]
  gem.email         = ["goya.victor@gmail.com"]
  gem.description   = "Arthropod based Rack server"
  gem.summary       = "This thing is probably a bad idea"

  gem.files         = `git ls-files -z`.split("\x0")
  gem.require_paths = ["lib"]
  gem.bindir        = 'bin'
  gem.executables   = %w(mite)

  gem.licenses      = ["MIT"]

  gem.add_dependency 'aws-sdk-sqs'
  gem.add_dependency 'rack'
  gem.add_dependency 'arthropod'

  gem.required_ruby_version = "~> 2.0"

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'byebug'
end
