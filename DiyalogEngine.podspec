
# Be sure to run `pod lib lint DiyalogEngine.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DiyalogEngine'
  s.version          = '4.10.0'
  s.summary          = 'DiyalogEngine iOS SDK for intergration DiyalogEngine Messaging to your apps.'

  s.homepage         = 'https://github.com/diyalog-im/DiyalogEngine'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Diyalog' => 'diyalog-im@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/diyalog-im/DiyalogEngine.git', :tag => s.version.to_s }
  s.public_header_files = "DiyalogEngine/DiyalogEngine.framework/Headers/*.h"
  s.source_files     = "DiyalogEngine/DiyalogEngine.framework/Headers/*.h"

  s.ios.deployment_target = '10.0'

  s.prepare_command = <<-CMD
      echo 'fetching DiyalogEngine.xcframework'
      curl -OL 'https://diyalog.im/releases/DiyalogEngine/4.10.0/DiyalogEngine.zip'
      rm -fr 'DiyalogEngine.framework'
      rm -fr 'DiyalogEngine.xcframework'
      echo 'unzipping DiyalogEngine.xcframework'
      unzip -o -q DiyalogEngine.zip
      echo 'cleaning files'
      rm DiyalogEngine.zip
    CMD

  s.preserve_paths = 'DiyalogEngine'
  s.vendored_frameworks =  'DiyalogEngine.xcframework'
  
  s.xcconfig = {
     "SWIFT_INCLUDE_PATHS" => "${PODS_ROOT}/DiyalogEngine",
     "FRAMEWORK_SEARCH_PATHS" => "${PODS_ROOT}/DiyalogEngine",
     "HEADER_SEARCH_PATHS" => "${PODS_ROOT}/DiyalogEngine"
	
  }
end

