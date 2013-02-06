# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shortee/version'

Gem::Specification.new do |gem|
  gem.name          = "shortee"
  gem.version       = Shortee::VERSION
  gem.authors       = ["Jeremy Nevill"]
  gem.email         = ["jeremy@nevill.net"]
  gem.description   = %q{Shortee message parser and specification for tracking events.}
  gem.summary       = %q{Shortee gem contains a message parser and specification for fast event tracking using single line messages.}
  gem.homepage      = "https://github.com/JeremyNevill/shortee"

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "parslet"
  gem.add_development_dependency "guard-rspec"


  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
