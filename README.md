# This repository

This repository is for https://kazucocoa.wordpress.com/2018/02/28/flutterflutter-app-with-appium/ . This is really experimental and showcase.

The experimental means I'd have liked to know if we can handle elements with what kind of resources. For example, `accessibilityIdentifier`(iOS) or `resource_id`(Android).

## Flutter app x Appium

Flutter has no `accessibilityIdentifier`(iOS) and `resource_id`(Android).

app: https://github.com/KazuCocoa/my_flutter_app

# Setup

## iOS

- Xcode 9.x or higher

## Android

- Get Android SDK (It's easy to get it via Android Studio)
  - https://developer.android.com/studio/
- Set `ANDROID_HOME`
  - hint: https://stackoverflow.com/questions/19986214/setting-android-home-enviromental-variable-on-mac-os-x
- [Create an Android 8.1 emulator](https://developer.android.com/studio/run/managing-avds) and launch it

## Appium

```bash
$ npm install -g appium
$ appium
```

## Ruby

```ruby
bundle install
```

# Run

```bash
# shell 1
$ appium
```

```ruby
# shell 2
$ ruby test/rb
```

