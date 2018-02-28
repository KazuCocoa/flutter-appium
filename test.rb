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
  },
  appium_lib: {
    export_session: true,
    wait: 30,
    wait_timeout: 20,
    wait_interval: 1
  }
}.freeze

ANDROID_OPS = {
    caps: {
        platformName: :android,
        automationName: 'uiautomator2',
        app: 'android/app-debug.apk',
        platformVersion: '8.1.0',
        deviceName: 'Android Emulator',
        appPackage: 'com.example.myflutterapp',
        unicodeKeyboard: true,
        resetKeyboard: true
    },
    appium_lib: {
        export_session: true,
        wait: 30,
        wait_timeout: 20,
        wait_interval: 1
    }
}.freeze


# Android
# core ||= ::Appium::Core.for(self, ANDROID_OPS)
# driver ||= core.start_driver
# element = driver.find_element :class, "android.widget.EditText"

# iOS
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
