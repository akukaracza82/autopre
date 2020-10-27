require 'capybara/poltergeist'

Capybara.default_driver = :poltergeist

browser = Capybara.current_session

browser.visit 'http://addleedrivers.co.uk'

puts browser.html
