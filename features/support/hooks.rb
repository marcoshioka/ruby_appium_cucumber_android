# frozen_string_literal: true

require 'selenium-webdriver'

Before do
  driver.start_driver
end

After do
  driver.driver_quit
end

AfterStep do 
  @data = DateTime.now.strftime('%d_%m_%Y')
  @tempo = Time.now.strftime("%H:%M:%S")
  @driver.save_viewport_screenshot './screenshot/' + @data + '-' + @tempo + '.png'
end

After do |scenario|
  if scenario.failed?
    @driver.save_viewport_screenshot './screenshot/failed.png'
  end
end

$wait = Selenium::WebDriver::Wait.new(timeout: 120)
