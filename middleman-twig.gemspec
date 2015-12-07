# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "middleman-twig/version"

Gem::Specification.new do |s|
  s.name        = "middleman-twig"
  s.version     = Middleman::TwigExtension::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Your Name"]
  # s.email       = ["email@example.com"]
  # s.homepage    = "http://example.com"
  s.summary     =  'middleman from a dynamic source'
  # s.description = %q{A longer description of your extension}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # The version of middleman-core your extension depends on
  # s.add_runtime_dependency("middleman-core", [">= 3.3.12"])
  s.add_runtime_dependency("middleman-core")
  # s.add_runtime_dependency("ruby-twig", git: 'https://github.com/page-io/ruby-twig')

  # Additional dependencies
  # s.add_runtime_dependency("gem-name", "gem-version")
end
