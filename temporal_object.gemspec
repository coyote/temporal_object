# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "temporal_object/version"

Gem::Specification.new do |s|
  s.name        = "temporal_object"
  s.version     = TemporalObject::VERSION
  s.authors     = ["Craig A. Cook"]
  s.email       = ["craig.a.cook@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Temporal Object Design Pattern}
  s.description = %q{Martin Fowler's Temporal Object Pattern.}
  s.license     = 'MIT'
  s.rubyforge_project = "temporal_object"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_runtime_dependency "time_span"
end
