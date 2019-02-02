#
# Be sure to run `pod lib lint PersistentValue.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PersistentValue'
  s.version          = '0.3.0'
  s.summary          = 'Type safe persistent values for NSUserDefaults, KeyChain, and values backed by an app file'

  # Temporary-- this Pod really needs to be pushed up to Cocoapods
  # s.homepage         = 'https://github.com/RosterHQ/PersistentValue'
  s.homepage         = 'https://github.com/crspybits/PersistentValue'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'crspybits' => 'chris@SpasticMuffin.biz' }

  # Temporary-- this Pod really needs to be pushed up to Cocoapods
  # s.source           = { :git => 'https://github.com/RosterHQ/PersistentValue.git', :tag => s.version.to_s }
  s.source           = { :git => 'https://github.com/crspybits/PersistentValue.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files = 'PersistentValue/Classes/**/*'
  s.dependency 'KeychainAccess', '~> 3.1'
  s.dependency 'SwiftyUserDefaults', '~> 3.0'

  s.swift_version = '4.2'
end
