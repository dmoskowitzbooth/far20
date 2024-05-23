# -*- encoding: utf-8 -*-
# stub: tabulo 2.8.2 ruby lib

Gem::Specification.new do |s|
  s.name = "tabulo".freeze
  s.version = "2.8.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://raw.githubusercontent.com/matt-harvey/tabulo/master/CHANGELOG.md", "source_code_uri" => "https://github.com/matt-harvey/tabulo" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Matthew Harvey".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-01-18"
  s.description = "Plain text table generator with a column-based API".freeze
  s.email = ["software@matthewharvey.net".freeze]
  s.homepage = "https://github.com/matt-harvey/tabulo".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1.10".freeze)
  s.rubygems_version = "3.4.6".freeze
  s.summary = "Terminal table generator".freeze

  s.installed_by_version = "3.4.6" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<tty-screen>.freeze, ["= 0.8.1"])
  s.add_runtime_dependency(%q<unicode-display_width>.freeze, ["~> 2.2"])
  s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.11"])
  s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
  s.add_development_dependency(%q<simplecov-lcov>.freeze, [">= 0"])
  s.add_development_dependency(%q<yard>.freeze, [">= 0"])
  s.add_development_dependency(%q<redcarpet>.freeze, [">= 0"])
  s.add_development_dependency(%q<github-markup>.freeze, [">= 0"])
  s.add_development_dependency(%q<rake-version>.freeze, ["~> 1.0"])
end
