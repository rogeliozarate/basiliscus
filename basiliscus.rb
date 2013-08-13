require "sinatra"
require "sinatra/reloader" if development?
require "selenium-webdriver"
 


get "/" do
  "home sweet home"
end

get '/snapshot' do
site = "https://github.com/rogeliozarate"
 
driver = Selenium::WebDriver.for :chrome
driver.navigate.to site
driver.manage.window.maximize
sleep 5                                          # required to wait until scripts and images are loaded
screenshot_time = Time.now.strftime("%Y-%m-%dT%H-%M-%S")
driver.save_screenshot("#{screenshot_time}.png")
driver.quit

# `open "#{screenshot_time}.png"`
  
end