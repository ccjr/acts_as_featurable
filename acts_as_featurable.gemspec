# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'acts_as_featurable/version'

Gem::Specification.new do |gem|
  gem.name          = "acts_as_featurable"
  gem.version       = ActsAsFeaturable::VERSION
  gem.authors       = ["Cloves Carneiro"]
  gem.email         = ["ccarneiroj@gmail.com"]
  gem.description   = %q{Feature a specific object for a pre-defined amount of time.}
  gem.summary       = %q{You can easily manage featured objects in a admin UI by saffolding the featured_period object.}
  gem.homepage      = "https://github.com/ccjr/acts_as_featurable"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
