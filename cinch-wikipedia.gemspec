# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cinch/plugins/wikipedia/version'

Gem::Specification.new do |gem|
  gem.name          = 'cinch-wikipedia'
  gem.version       = Cinch::Plugins::Wikipedia::VERSION
  gem.authors       = ['Brian Haberer']
  gem.email         = ['bhaberer@gmail.com']
  gem.description   = 'Cinch plugin that fetches a truncated blurb from the '\
                      'head of a wikipedia page.'
  gem.summary       = 'Cinch Wikipedia Plugin'
  gem.homepage      = 'https://github.com/bhaberer/cinch-wikipedia'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rake', '~> 10'
  gem.add_development_dependency 'rspec', '~> 3'
  gem.add_development_dependency 'cinch-test', '~> 0.1', '>= 0.1.1'
  gem.add_development_dependency 'codeclimate-test-reporter'

  gem.add_dependency 'cinch', '~> 2'
  gem.add_dependency 'cinch-cooldown', '~> 1.1.7'
  gem.add_dependency 'cinch-toolbox', '~> 1.1.6'
end
