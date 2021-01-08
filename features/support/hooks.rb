require "selenium-webdriver"

Before do
  driver.start_driver
end

After do
  driver.driver_quit
end

$wait = Selenium::WebDriver::Wait.new(:timeout => 120)
