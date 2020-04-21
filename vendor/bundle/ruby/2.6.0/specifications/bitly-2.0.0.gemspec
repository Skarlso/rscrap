# -*- encoding: utf-8 -*-
# stub: bitly 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "bitly".freeze
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/philnash/bitly/issues", "changelog_uri" => "https://github.com/philnash/bitly/blob/master/History.txt", "documentation_uri" => "https://www.rubydoc.info/gems/bitly/", "homepage_uri" => "https://github.com/philnash/bitly", "source_code_uri" => "https://github.com/philnash/bitly" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Phil Nash".freeze]
  s.date = "2020-03-12"
  s.description = "Use the Bitly API version 4 to shorten or expand URLs. Check out the API documentation at https://dev.bitly.com/.".freeze
  s.email = ["philnash@gmail.com".freeze]
  s.homepage = "https://github.com/philnash/bitly".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Use the Bitly API to shorten or expand URLs".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<oauth2>.freeze, [">= 0.5.0", "< 2.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.17.1"])
      s.add_development_dependency(%q<webmock>.freeze, ["~> 3.7.6"])
      s.add_development_dependency(%q<vcr>.freeze, [">= 0"])
      s.add_development_dependency(%q<envyable>.freeze, [">= 0"])
    else
      s.add_dependency(%q<oauth2>.freeze, [">= 0.5.0", "< 2.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 2.0"])
      s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.17.1"])
      s.add_dependency(%q<webmock>.freeze, ["~> 3.7.6"])
      s.add_dependency(%q<vcr>.freeze, [">= 0"])
      s.add_dependency(%q<envyable>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<oauth2>.freeze, [">= 0.5.0", "< 2.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.17.1"])
    s.add_dependency(%q<webmock>.freeze, ["~> 3.7.6"])
    s.add_dependency(%q<vcr>.freeze, [">= 0"])
    s.add_dependency(%q<envyable>.freeze, [">= 0"])
  end
end
