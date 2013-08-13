require "sinatra"
require "sinatra/reloader" if development?
require "selenium-webdriver"
 


get "/" do
  "home sweet home"
end

get '/take' do
  site = "https://github.com/rogeliozarate"                
  driver = Selenium::WebDriver.for :chrome
  driver.navigate.to site
  driver.manage.window.maximize
  sleep 5                                                       # required to wait until scripts and images are loaded
  #screenshot_time = Time.now.strftime("%Y-%m-%dT%H-%M-%S")     # required to name the file, if written to filesystem
  #driver.save_screenshot("#{screenshot_time}.png")             # using another API point to save the file
  take_one = driver.screenshot_as(:png)
  driver.quit
  content_type "image/png"                                      # setting the MIME value
  take_one                                                      # serving the file
end