# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "go_to_meeting/version"

Gem::Specification.new do |s|
  s.name        = "go_to_meeting"
  s.version     = GoToMeeting::VERSION
  s.authors     = ["nathanwfish"]
  s.email       = ["nathanwfish@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Wrapper around GoToMeeting API}
  s.description = %q{Wrapper around GoToMeeting API}

  s.rubyforge_project = "go_to_meeting"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency 'httparty'
  
  s.add_development_dependency "shoulda"
  s.add_development_dependency "mocha"
  s.add_development_dependency "fakeweb"
  s.add_development_dependency "test/unit"
  
end
