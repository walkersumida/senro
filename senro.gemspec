
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "senro/version"

Gem::Specification.new do |spec|
  spec.name          = "senro"
  spec.version       = Senro::VERSION
  spec.authors       = ["WalkerSumida"]
  spec.email         = ["walkersumida@gmail.com"]

  spec.summary       = %q{Library for RESTful API}
  spec.description   = %q{Library for RESTful API}
  spec.homepage      = 'https://github.com/walkersumida/senro'
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec-rails", '~> 3.9'
  spec.add_development_dependency "rails", ">= 5"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency 'pry'

  spec.required_ruby_version = '>= 2.5'
  spec.add_runtime_dependency('activesupport', '>= 5')
  spec.add_runtime_dependency('actionpack', '>= 5')
end
