# frozen_string_literal: true
require 'pry'
require_relative 'utils'

Before do
  tempDirectories()
  $driver.start_driver 
end

After do 
  $driver.driver_quit
end

After do |scenario|
  screenshot 'resultado'
  $driver.close_app
  $logger.info("Teste #{@scenario_name} finalizado")
end