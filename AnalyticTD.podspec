#
# Be sure to run `pod lib lint AnalyticTD.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AnalyticTD'
  s.version          = '0.1.5'
  s.summary          = 'AnalyticTD'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
AnalyticTD.
                       DESC

  s.homepage         = 'https://github.com/ietstudio/AnalyticTD'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gaoyang' => 'geekgaoyang@gmail.com' }
  s.source           = { :git => 'https://github.com/ietstudio/AnalyticTD.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'

  # s.resource_bundles = {
  #   'AnalyticTD' => ['AnalyticTD/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'GamePluginBase'

  s.source_files = 'AnalyticTD/Classes/**/*', 'AnalyticTD/SDK/SaaS_GameAnalytics_iOS_SDK_V4.0.12/*.h'
  s.vendored_libraries = 'AnalyticTD/SDK/SaaS_GameAnalytics_iOS_SDK_V4.0.12/libTalkingDataGA.a'
  s.frameworks = 'AdSupport', 'CoreTelephony', 'Security', 'SystemConfiguration'
  s.libraries = 'z'
end
