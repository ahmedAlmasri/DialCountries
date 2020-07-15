#
# Be sure to run `pod lib lint DialCountries.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DialCountries'
  s.version          = '0.1.0'
  s.summary          = 'DialCountries is a swift countrycontroller. Provides country name, ISO 3166 country codes, country flag, and calling codes'

  s.homepage         = 'https://github.com/ahmedAlmasri/DialCountries'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ahmad Almasri' => 'ahmed.almasri@ymail.com' }
  s.source           = { :git => 'https://github.com/ahmedAlmasri/DialCountries.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.swift_version    = '5.0'

  s.source_files = 'DialCountries/Classes/**/*'
  s.resource_bundle = { 'DialCountries' => 'DialCountries/Classes/**/*.{json}' }
end
