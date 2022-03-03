# -*- encoding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + "/lib/ruby_appium")

Gem::Specification.new do |s|
  s.name             = %q{ruby-mobile-appium-template}
  s.summary          = %q{A basic archetype for a Ruby Mobile Appium}
  s.description      = %q{generates directory and required files for any type of project needing to test with Ruby Mobile Appium }
  s.homepage         = %q{http://github.com/rogerfernandess/ruby-mobile-appium-template}
  s.version          = RubyAppium::VERSION
  s.authors          = "Roger Fernandes"
  s.email            = %q{roger.fernandess@hotmail.com}
  s.rubygems_version = %q{3.0.0}
  s.date             = %q{2022-03-02}
  s.require_paths    = ["lib"]
  s.files = ["bin/ruby-mobile-appium-template", 
             "lib/ruby_appium.rb",
             "templates/cucumber.yml",
             "templates/Gemfile",
             "templates/Rakefile",
             "templates/config/android/appium_farm.txt",
             "templates/config/android/appium.txt",
             "templates/config/ios/appium_farm.txt",
             "templates/config/ios/appium.txt",
             "templates/features/login/data/login.yaml",
             "templates/features/login/elements/screen_mappings_home.yaml",
             "templates/features/login/elements/screen_mappings_login.yaml",
             "templates/features/login/elements/screen_mappings_organizadorhome.yaml",
             "templates/features/login/elements/screen_mappings_token.yaml",
             "templates/features/login/features/login.feature",
             "templates/features/login/pageobjects/home.rb",
             "templates/features/login/pageobjects/login.rb",
             "templates/features/login/pageobjects/loginPages.rb",
             "templates/features/login/pageobjects/organizadorHome.rb",
             "templates/features/login/pageobjects/token.rb",
             "templates/features/login/steps/login_steps.rb",
             "templates/features/support/appium_custom.rb",
             "templates/features/support/env.rb",
             "templates/features/support/hooks.rb",
             "templates/features/support/utils.rb",
             "templates/.gitignore"]
  s.executables      = ["ruby-mobile-appium-template"]

  s.add_dependency("thor")
  s.add_dependency("rake")
  s.add_dependency('cucumber-rails')
  s.add_dependency("cucumber")
  s.add_dependency("selenium-webdriver")
  s.add_dependency("capybara")
  s.add_dependency("bundler")
  s.add_dependency("nokogiri")
  s.add_dependency("rspec")
end
