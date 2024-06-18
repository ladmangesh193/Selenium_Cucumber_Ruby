require 'selenium-cucumber'

# Do Not Remove This File
# Add your custom steps here
# $driver is instance of webdriver use this instance to write your custom code
And(/^I get text of element having xpath "(.*?)"$/) do |access_name|
  element = $driver.find_element(xpath: "#{access_name}")
  puts element.text
end

And(/^I use new window$/) do
  main_window = $driver.window_handles
  $driver.switch_to.window main_window[1]
end

And(/^I close current window and switch back to previous window$/) do
  main_window = $driver.window_handles
  $driver.close
  $driver.switch_to.window main_window[0]
end

And(/^I check alert is present$/) do
  alert = $driver.switch_to.alert
  alert.accept
end

And(/^I print yaml file path and variable$/) do
  $yaml_hash = YAML.load_file(File.join(File.dirname(__FILE__),'..', 'support/objects_variables.yaml'))
  puts "yaml has is"
  puts $yaml_hash
  puts "variable accessed from yaml is"
  puts $yaml_hash['link_text']
end
