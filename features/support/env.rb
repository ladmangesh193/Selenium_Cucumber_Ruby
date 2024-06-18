require 'rubygems'
require 'selenium-cucumber'
require 'yaml'

# Store command line arguments
$browser_type = ENV['BROWSER'] || 'ff'
$platform = ENV['PLATFORM'] || 'desktop'
$os_version = ENV['OS_VERSION']
$device_name = ENV['DEVICE_NAME']
$udid = ENV['UDID']
$app_path = ENV['APP_PATH']

#read from yaml file
#dir_to_yaml = File.dirname(__FILE__)
dir_to_yaml = Dir.pwd + '/features/support'
$yaml_hash = YAML.load_file("#{dir_to_yaml}/objects_variables.yaml")
#$yaml_hash = YAML.load_file(File.join(File.dirname(__FILE__),'..', 'support/objects_variables.yaml'))

# check for valid parameters
validate_parameters $platform, $browser_type, $app_path

# If platform is android or ios create driver instance for mobile browser
if $platform == 'android' or $platform == 'iOS'

  if $browser_type == 'native'
    $browser_type = "Browser"
  end

  if $platform == 'android'
    $device_name, $os_version = get_device_info
  end

  desired_caps = {
    caps:       {
      platformName:  $platform,
      browserName: $browser_type,
      versionNumber: $os_version,
      deviceName: $device_name,
      udid: $udid,
      app: ".//#{$app_path}"
      },
    }

  begin
    $driver = Appium::Driver.new(desired_caps).start_driver
  rescue Exception => e
    puts e.message
    Process.exit(0)
  end
else # else create driver instance for desktop browser
  begin
    url = "http://www.seleniumframework.com/Practiceform/"
    $driver = Selenium::WebDriver.for(:"#{$browser_type}")
    $driver.manage().window().maximize()
    $driver.navigate.to(url)
    $wait = Selenium::WebDriver::Wait.new(:timeout => 20)
  rescue Exception => e
    puts e.message
    Process.exit(0)
  end
end

at_exit do
  $driver.close
end
