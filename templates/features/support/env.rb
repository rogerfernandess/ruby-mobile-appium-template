# frozen_string_literal: true

require 'appium_lib'
require 'pry'
require 'cucumber'
require 'selenium-webdriver'
require 'allure-cucumber'
require_relative 'utils'

verify_platform()
verify_where()

def load_appium_configuration
  caps = Appium.load_appium_txt file: File.join("#{Dir.pwd}/config/#{$platform}/#{$where == 'farm' ? 'appium_farm.txt' : 'appium.txt'}")
  caps[:caps][:oauthClientId] = 'oauth2-PFoYDkJ2wrTokwrS3l5Q@microfocus.com' #colocar valor do clientID gerado nas credenciais da Farm UFT
  caps[:caps][:oauthClientSecret] = 'x1V3tLi5Mi1qMEqkJJGD' #colocar valor da ClienteSecret gerado nas credenciais da Farm UFT
  return caps 
end

$wait = Selenium::WebDriver::Wait.new(timeout: 60)
Appium::Driver.new(load_appium_configuration(), true)
