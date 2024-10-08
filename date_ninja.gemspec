# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'date_ninja/version'

Gem::Specification.new do |spec|
  spec.name          = "date_ninja"
  spec.version       = DateNinja::VERSION
  spec.authors       = ["Rob Paulo"]
  spec.email         = ["rob@mpowered.co.za"]
  spec.description   = "simply makes sure evil dates dont destroy your system"
  spec.summary       = "Excel date format validator"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.13.0"
  spec.add_development_dependency "activesupport", "> 5"
end
