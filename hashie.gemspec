# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hashie/version'

Gem::Specification.new do |spec|
  spec.name          = "hashie"
  spec.version       = Hashie::VERSION
  spec.authors       = ["Vasiliy Yorkin & Artem Kadeev"]
  spec.email         = ["vasiliy.yorkin@gmail.com"]
  spec.description   = "Trying to build smth like hashie"
  spec.summary       = "Workshop hashie"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_development_dependency "bundler", "~> 1.3"
end
