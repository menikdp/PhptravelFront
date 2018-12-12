require 'selenium-webdriver'
require 'rubygems'
require 'rspec/expectations'

Before do
  @driver = Selenium::WebDriver.for:chrome
  @driver.manage.window.maximize
  @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  @time = 4
end

# After do
#   @driver.quit
# end