require "selenium-webdriver"
 
site = "http://earlyadopters.mx/"
 
driver = Selenium::WebDriver.for :chrome
driver.navigate.to site
driver.manage.window.maximize
sleep 5                                          # required to wait until scripts and images are loaded
driver.save_screenshot('screenshot.png')
driver.quit
 
