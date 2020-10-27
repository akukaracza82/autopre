#importing the files
require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 10)


driver.get 'https://addleedrivers.co.uk/drp/#/driver/login'

wait.until { driver.page_source.include?("password") }

driver.find_element(id: 'driver-login-username').send_keys("12357")
driver.find_element(id: 'driver-login-password').send_keys("Password1", :enter)

POSTCODES = [' TN1',  ' TN2', ' TN3', ' TN4', " TN9", ' TN10',' TN11',' TN12',
             ' TN13', ' TN14',' TN15',' TN17',' TN18',' TN19',' TN23',' TN24',
             ' TN25', ' TN26',' TN27',' ME1', ' ME2', ' ME3', ' ME4', ' ME5',
             ' ME6',  ' ME7', ' ME8', ' ME9', ' ME10',' ME11',' ME12',' ME13',
             ' ME14', ' ME15',' ME16',' ME17',' ME18',' ME19',' ME20',' CT1',
             ' CT2',  ' CT3', ' CT4',  'SE10', 'SE3', ' SE18', 'E14', ' GATWICK']

loop do
  prebooks = driver.page_source
  driver.get 'https://addleedrivers.co.uk/drp/#/driver/prebook'
  wait.until { driver.page_source.include?("Distance") }
  if POSTCODES.any? {|pc| prebooks.include?(pc)}
    driver.manage.window.maximize
    system 'cvlc /home/artur/Downloads/ring.mp3'
    break
  end
  sleep rand(1.2...1.91)
 end
#
#  sleep 2
#
# table = driver.find_element(class: '.container')
# table.find_element(class: "td").each do |td|
#   location = td.find_element(:css, 'td:nth-child(2)').text
#     postcode = location.split(',').last
#     if postcode.split(' ').first == 'BR3'
#       tr.find_element(:button).click
#     end
# end



driver.quit
