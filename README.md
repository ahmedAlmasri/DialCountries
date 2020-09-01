# DialCountries

[![CI Status](https://img.shields.io/travis/ahmed.almasri@ymail.com/DialCountries.svg?style=flat)](https://travis-ci.org/ahmed.almasri@ymail.com/DialCountries)
[![Version](https://img.shields.io/cocoapods/v/DialCountries.svg?style=flat)](https://cocoapods.org/pods/DialCountries)
[![License](https://img.shields.io/cocoapods/l/DialCountries.svg?style=flat)](https://cocoapods.org/pods/DialCountries)
[![Platform](https://img.shields.io/cocoapods/p/DialCountries.svg?style=flat)](https://cocoapods.org/pods/DialCountries)

## Features

- [ ] Support multiple languages.
- [ ] Support Dark mode.
- [ ] Search using many keywords (ISO2, Dial code, Country name).

## Screenshots

| English  |  Japanese |
|---|---|
| <img src="Screenshots/screen_en.gif">  |  <img src="Screenshots/screen_ja.gif">|

## Using

* Show `DialCountriesController`

```swift
let controller = DialCountriesController(locale: Locale(identifier: "ja"))
    controller.delegate = self
    controller.show(vc: self)
```

* Delegate for selection

```swift
extension ViewController: DialCountriesControllerDelegate {
 func didSelected(with country: Country) {
  print(country)
 }
}
```

* Get Current country

```swift
Country.getCurrentCountry()
```

## Requirements

* iOS 12.0+
* Swift 5.0+
* Xcode 10.0+

## Installation

DialCountries is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DialCountries'
```

## Author

Ahmad Almasri, ahmed.almasri@ymail.com

## License

DialCountries is available under the MIT license. See the LICENSE file for more info.
