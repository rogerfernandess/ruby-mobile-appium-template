require "thor"
require "thor/group"
require "fileutils"

class RubyAppium < Thor::Group
  include Thor::Actions

  VERSION = "1.1.5"

  argument :dir_name

  def self.source_root
    File.join(File.dirname(__FILE__), "..", "templates")

  end

  def create_new_cucumber_directory
    self.destination_root = File.expand_path(dir_name)
    make_empty_directory
    FileUtils.cd(destination_root)
    gemfile_rakefile_cukeyml
    create_folders
    create_files
  end

  protected

  def make_empty_directory
    empty_directory "."
  end

  def create_folders
    empty_directory "app"
    empty_directory "config"
    empty_directory "features"

    inside "app" do
      empty_directory "ios"
      empty_directory "android"
    end

    inside "config" do
      empty_directory "ios"
      empty_directory "android"
    end

    inside "features" do
      empty_directory "login"
      empty_directory "support"
    end
    
    inside "features/login" do
      empty_directory "features"
      empty_directory "data"
      empty_directory "elements"
      empty_directory "pageobjects"
      empty_directory "steps"
    end
  end

    def create_files
    inside "config/ios" do
      template "appium.txt"
      template "appium_farm.txt"
    end

    inside "config/android" do
      template "appium.txt"
      template "appium_farm.txt"
    end

    inside "features/support" do
      template "env.rb"
      template "hooks.rb"
      template "utils.rb"
      template "appium_custom.rb"
    end
    
    inside "features/login/features" do
      template "login.feature"
    end

    inside "features/login/data" do
      template "login.yaml"
    end

    inside "features/login/elements" do
      template "screen_mappings_home.yaml"
      template "screen_mappings_login.yaml"
      template "screen_mappings_organizadorhome.yaml"
      template "screen_mappings_token.yaml" 
    end

    inside "features/login/pageobjects" do
      template "home.rb"
      template "login.rb"
      template "loginPages.rb"
      template "organizadorHome.rb"
      template "token.rb"
    end

    inside "features/login/steps" do
      template "login_steps.rb"   
    end
  end

  def gemfile_rakefile_cukeyml
    inside destination_root do
      template "Gemfile"
      template "Rakefile"
      template "cucumber.yml"
    end
  end

end
