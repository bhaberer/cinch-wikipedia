# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cinch/plugins/wikipedia/version'

Gem::Specification.new do |gem|
  gem.name          = "cinch-wikipedia"
  gem.version       = Cinch::Plugins::Wikipedia::VERSION
  gem.authors       = ["Brian Haberer"]
  gem.email         = ["bhaberer@gmail.com"]
  gem.description   = %q{Cinch plugin that fetches a truncated blurb from the head of a wikipedia page.}
  gem.summary       = %q{Cinch Wikipedia Plugin}
  gem.homepage      = "https://github.com/bhaberer/cinch-wikipedia"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'coveralls'

  gem.add_dependency 'cinch',           '~> 2.0.4'
  gem.add_dependency 'cinch-toolbox',   '~> 1.0.0'
  gem.add_dependency 'cinch-cooldown',  '~> 1.0.0'
end
