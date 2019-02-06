require 'appium_lib_core'

IOS_OPS = {
    desired_capabilities: {
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
    wait_timeout: 20,
    wait_interval: 1
  }
}.freeze

ANDROID_OPS = {
  desired_capabilities: {
    platformName: :android,
    automationName: 'uiautomator2', # failed to launch with espresso driver...
    app: 'android/app-debug.apk',
    deviceName: 'Android Emulator',
    appPackage: 'com.example.myflutterapp2',
    unicodeKeyboard: true,
    resetKeyboard: true
  },
  appium_lib: {
    wait_timeout: 20,
    wait_interval: 1
  }
}.freeze

# Android
def run_android_test
  core = Appium::Core.for ANDROID_OPS
  driver = core.start_driver

  e_number = core.wait { driver.find_element :xpath, '//android.view.View[@text="0"]' }

  element_increment = driver.find_element :class, 'android.widget.Button'
  element_increment.text == 'Increment'

  element_increment.click
  core.wait_true { e_number.text == '1' }
  unless e_number.text == '1'
    raise 'fail'
    return
  end

  element_increment.click
  core.wait_true { e_number.text == '2' }
  unless e_number.text == '2'
    raise 'fail'
    return
  end

  puts "finish in run_android_test"
end

# iOS
def run_ios_test
  core = Appium::Core.for IOS_OPS
  driver = core.start_driver

  driver.find_element :name, '0'

  element_increment = driver.find_element :name, "Increment"

  element_increment.click
  e = driver.find_element :name, '1'
  unless e.text == '1'
    raise 'fail'
    return
  end

  element_increment.click
  e = driver.find_element :name, '2'
  unless e.text == '2'
    raise 'fail'
    return
  end

  puts "finish in run_ios_test"
end

# Run Android sample test and iOS test
run_android_test
run_ios_test
