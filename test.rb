require 'appium_lib_core'

IOS_OPS = {
  caps: {
    platformName: :ios,
    automationName: 'XCUITest',
    app: 'ios/iphonesimulator/Runner.app',
    platformVersion: '10.3',
    deviceName: 'iPhone Simulator',
    useNewWDA: true,
    useJSONSource: true,
    someCapability: 'some_capability'
  },
  appium_lib: {
    export_session: true,
    wait: 30,
    wait_timeout: 20,
    wait_interval: 1
  }
}.freeze


core ||= ::Appium::Core.for(self, IOS_OPS)
driver ||= core.start_driver

driver.find_element :name, "0"

b = driver.find_element :name, "Increment"
b.click

element = driver.find_element :name, "1"
unless element.name == "1"
  puts "fail"
  return
end

b.click
element = driver.find_element :name, "2"
unless element.name == "2"
  puts "fail"
  return
end

puts "finish"