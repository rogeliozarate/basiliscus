require "selenium-webdriver"
 
site = "http://earlyadopters.mx/"
 
driver = Selenium::WebDriver.for :chrome
driver.navigate.to site
driver.manage.window.maximize
sleep 5                                          # required to wait until scripts and images are loaded
screenshot_time = Time.now.strftime("%Y-%m-%dT%H-%M-%S")
driver.save_screenshot("#{screenshot_time}.png")
driver.quit
