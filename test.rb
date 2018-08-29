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
def run_android_test
  core ||= ::Appium::Core.for(ANDROID_OPS)
  driver ||= core.start_driver
  sleep 3

  elements = driver.find_elements :class, "Flutter"
  unless elements.size == 3 && elements[1].text == "FriendlyChat"
    puts "fail"
    return
  end

  element = driver.find_element :class, "android.widget.EditText"
  unless element.text == "Send a message"
    puts "fail"
    return
  end

  puts "finish in run_android_test"
end

# iOS
def run_ios_test
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

  puts "finish in run_ios_test"
end

# Run Android sample test and iOS test
run_android_test
run_ios_test
