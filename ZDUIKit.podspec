#
# Be sure to run `pod lib lint ZDUIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZDUIKit'
  s.version          = '0.1.2'
  s.summary          = 'A short description of ZDUIKit.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/jj89757hhb/ZDUIKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jj89757hhb' => 'jj89757hhb.happy@163.com' }
  s.source           = { :git => 'https://github.com/jj89757hhb/ZDUIKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  # s.source_files = 'ZDUIKit/Classes/**/*'
  s.source_files = 'ZDUIKit/Classes/ZDUIKit.h'
  s.resource = 'ZDUIKit/Assets'

s.subspec 'Base' do |ss|
ss.source_files = 'ZDUIKit/Classes/Base/**/*'
ss.dependency 'Masonry'
ss.dependency 'ZDFoundation'
ss.private_header_files = 'ZDUIKit/Classes/Base/ZDUIMethodSwizzling.h'
end

s.subspec 'Refresh' do |ss|
ss.source_files = 'ZDUIKit/Classes/Refresh/**/*'
#ss.resources = 'ZDUIKit/Assets/Refresh.xcassets'
ss.dependency 'MJRefresh'
ss.dependency 'ZDUIKit/Base'
end

s.subspec 'Banner' do |ss|
ss.source_files = 'ZDUIKit/Classes/Banner/**/*'
end

s.subspec 'Alert' do |ss|
ss.source_files = 'ZDUIKit/Classes/Alert/**/*'
end

s.subspec 'Margin' do |ss|
ss.source_files = 'ZDUIKit/Classes/Margin/**/*'
end

s.subspec 'GradientView' do |ss|
ss.source_files = 'ZDUIKit/Classes/GradientView/**/*'
end
s.subspec 'PromptBtn' do |ss|
ss.source_files = 'ZDUIKit/Classes/PromptBtn/**/*'
ss.dependency 'ZDUIKit/Margin'
ss.dependency 'ZDUIKit/Base'
end

s.subspec 'Toast' do |ss|
ss.source_files = 'ZDUIKit/Classes/Toast/**/*'
ss.dependency 'MBProgressHUD'
ss.dependency 'ZDUIKit/Base'
ss.dependency 'ZDUIKit/SimButton'
ss.resources = 'ZDUIKit/Assets/Toast.xcassets'
#注意*号表示该目标的所有子字母都加载
#ss.resources = 'ZDUIKit/Assets/*'
end

s.subspec 'SimButton' do |ss|
ss.source_files = 'ZDUIKit/Classes/SimButton/**/*'
end
s.subspec 'Navigator' do |ss|
ss.source_files = 'ZDUIKit/Classes/Navigator/**/*'
end
s.subspec 'Tabbar' do |ss|
ss.source_files = 'ZDUIKit/Classes/Tabbar/**/*'
ss.dependency 'ZDUIKit/Base'
end

s.subspec 'Menu' do |ss|
ss.source_files = 'ZDUIKit/Classes/Menu/**/*'
ss.dependency 'ZDUIKit/Base'
ss.dependency 'Masonry'
end
s.subspec 'ScrollTable' do |ss|
ss.source_files = 'ZDUIKit/Classes/ScrollTable/**/*'
ss.dependency 'ZDUIKit/Base'
ss.dependency 'ZDUIKit/Tabbar'
ss.dependency 'ZDUIKit/Banner'
ss.dependency 'Masonry'
end
  
  # s.resource_bundles = {
  #   'ZDUIKit' => ['ZDUIKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
