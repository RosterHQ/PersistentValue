#
# Be sure to run `pod lib lint PersistentValue.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PersistentValue'
  s.version          = '0.1.0'
  s.summary          = 'Type safe persistent values for NSUserDefaults and for the KeyChain'

  s.homepage         = 'https://github.com/RosterHQ/PersistentValue'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'crspybits' => 'chris@SpasticMuffin.biz' }
  s.source           = { :git => 'https://github.com/RosterHQ/PersistentValue.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files = 'PersistentValue/Classes/**/*'
  s.dependency 'KeychainAccess', '~> 3.1'
  s.dependency 'SwiftyUserDefaults', '~> 3.0'

  s.swift_version = '4.2'
end
