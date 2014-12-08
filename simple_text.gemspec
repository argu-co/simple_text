$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_text/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_text"
  s.version     = SimpleText::VERSION
  s.authors     = ["Fletcher91"]
  s.email       = ["thomvankalkeren@gmail.com"]
  s.homepage    = "https://github.com/fletcher91/simple_text"
  s.summary     = "A simple markdown document system to present documents such as Terms & Conditions or a Privacy Policy."
  s.description = "A simple markdown document system to present documents such as Terms & Conditions or a Privacy Policy."
  s.license     = "APACHE 2.0"

  s.files = Dir["{app,config,db,lib}/**/*", "APACHE-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.0.0"
  s.add_dependency "slim", ">= 2.0.0"
  s.add_dependency "whodunnit", "~> 0.0.5"
  s.add_dependency "kaminari", ">= 0.16.0"
  s.add_dependency "redcarpet", "~> 3.1.2"

  s.add_development_dependency "sqlite3"
end
