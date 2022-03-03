require File.expand_path(File.dirname(__FILE__) + "/spec_helper")

describe RubyAppium do

  before do
    @dir_name = File.dirname(__FILE__)
    @ruby_appium = RubyAppium.new(:dir_name => @dir_name)
    RubyAppium.stub!(:new).and_return(@ruby_appium)
  end

  it 'should include the Thor::Actions module' do
    RubyAppium.included_modules.include?(Thor::Actions)
  end

  it 'should call create_new_cucumber_directory' do
    @ruby_appium.should_receive(:create_new_cucumber_directory)
    RubyAppium.start
  end

  context "#create_new_cucumber_directory" do

    before do
      File.stub!(:expand_path)
      FileUtils.stub!(:cd)
    end

    it 'should make an empty directory' do
      @ruby_appium.stub!(:gemfile_rakefile_cukeyml)
      @ruby_appium.stub!(:create_folders)
      @ruby_appium.stub!(:create_files)
      @ruby_appium.should_receive(:make_empty_directory)
      RubyAppium.start
    end

    it 'should create a new Gemfile, Rakefile, and cucumber.yml' do
      @ruby_appium.stub!(:create_folders)
      @ruby_appium.stub!(:create_files)
      @ruby_appium.stub!(:make_empty_directory)
      @ruby_appium.should_receive(:gemfile_rakefile_cukeyml)
      RubyAppium.start
    end

    it 'should create a new features directory'  do
      @ruby_appium.stub!(:gemfile_rakefile_cukeyml)
      @ruby_appium.stub!(:make_empty_directory)
      @ruby_appium.should_receive(:create_folders)
      RubyAppium.start
    end

  end

end