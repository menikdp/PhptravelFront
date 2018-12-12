require 'selenium-webdriver'
require 'rubygems'
require 'rspec/expectations'

Before do
  @driver = Selenium::WebDriver.for:chrome
  @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  @time = 3
end

# After do
#   @driver.quit
# end