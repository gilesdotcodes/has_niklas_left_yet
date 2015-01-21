# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'has_niklas_left_yet/version'

Gem::Specification.new do |spec|
  spec.name          = "has_niklas_left_yet"
  spec.version       = HasNiklasLeftYet::VERSION
  spec.authors       = ["Stephen Giles"]
  spec.email         = [""]
  spec.summary       = %q{Countdown to Niklas leaving.}
  spec.description   = %q{A gem to help me make some friends which
                            countdowns how long Niklas has left in the
                            office.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "delorean"
end
