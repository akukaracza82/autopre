#importing the files
require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

driver.get 'https://addleedrivers.co.uk/drp/#/driver/login'

sleep rand(0.50..1.00)

driver.find_element(id: 'driver-login-username').send_keys("12357")
driver.find_element(id: 'driver-login-password').send_keys("Password1")
driver.find_element(css: ".btn-primary").click

sleep rand(0.45...1.01)

driver.get 'https://addleedrivers.co.uk/drp/#/driver/prebook'
 
sleep rand(0.6..0.99)

prebooks = driver.page_source

POSTCODES = ["ME1", 'ME2', 'ME3', 'ME4', 'ME5', 'ME6', 'ME7', 'ME8', 'ME13', 'ME14', 
            'ME15', 'ME16', 'ME17', 'ME18', 'ME19', 'ME20', 'TN1', 'TN2', 'TN3', 'TN4', 
            'TN5', 'TN9', 'TN11', 'TN12', 'TN17', 'TN23', 'TN24', 'TN25', 'CT1', 'CT2', 'CT3', 'TN14', 'TN15', 'TN13', 'TN18']

loop do
  driver.get 'https://addleedrivers.co.uk/drp/#/driver/prebook'
  sleep rand(0.9...1.3)
  if POSTCODES.any? {|pc| prebooks.include?(pc) }
    driver.manage.window.maximize
    system 'espeak "Ding Ding"'
    break
  end
  sleep rand(2.0...5.0)
 end
 sleep 2000

driver.quit

