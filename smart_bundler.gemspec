# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smart_bundler/version'

Gem::Specification.new do |spec|
  spec.name          = "smart_bundler"
  spec.version       = SmartBundler::VERSION
  spec.authors       = ["Kevin VanGelder"]
  spec.email         = ["kevin@clearsightstudio.com"]
  spec.summary       = %q{Installs Gems unable to be installed by bundler}
  spec.description   = %q{Installs Gems unable to be installed by bundler}
  spec.homepage      = "https://github.com/clearsightstudio/smart_bundler"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
