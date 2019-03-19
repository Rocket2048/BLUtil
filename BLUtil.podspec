#
# Be sure to run `pod lib lint BLUtil.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BLUtil'
  s.version          = '1.0.0'
  s.summary          = 'Some Swift Utils'
  s.swift_version    = '4.0'
  
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Swift Utils And UIKit Foundation Extension
                       DESC

  s.homepage         = 'https://github.com/iosBob/BLUtil'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lin bo' => 'ok@linbok.com' }
  s.source           = { :git => 'https://github.com/iosBob/BLUtil.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'BLUtil/Classes/**/*'
  s.frameworks = 'UIKit', 'Foundation', 'CommonCrypto'

end
