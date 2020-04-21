# -*- encoding: utf-8 -*-
# stub: telegram-bot-ruby 0.12.0 ruby lib

Gem::Specification.new do |s|
  s.name = "telegram-bot-ruby".freeze
  s.version = "0.12.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Alexander Tipugin".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-01-26"
  s.email = ["atipugin@gmail.com".freeze]
  s.homepage = "https://github.com/atipugin/telegram-bot".freeze
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Ruby wrapper for Telegram's Bot API".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faraday>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<virtus>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<inflecto>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.48.1"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.4"])
      s.add_development_dependency(%q<rubocop-rspec>.freeze, ["~> 1.8"])
    else
      s.add_dependency(%q<faraday>.freeze, [">= 0"])
      s.add_dependency(%q<virtus>.freeze, [">= 0"])
      s.add_dependency(%q<inflecto>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.48.1"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.4"])
      s.add_dependency(%q<rubocop-rspec>.freeze, ["~> 1.8"])
    end
  else
    s.add_dependency(%q<faraday>.freeze, [">= 0"])
    s.add_dependency(%q<virtus>.freeze, [">= 0"])
    s.add_dependency(%q<inflecto>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.48.1"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.4"])
    s.add_dependency(%q<rubocop-rspec>.freeze, ["~> 1.8"])
  end
end
