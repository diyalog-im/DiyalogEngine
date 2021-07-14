# DiyalogEngine

[![CI Status](https://img.shields.io/travis/djderasari@weblineindia.com/DiyalogEngine.svg?style=flat)](https://travis-ci.org/djderasari@weblineindia.com/DiyalogEngine)
[![Version](https://img.shields.io/cocoapods/v/DiyalogEngine.svg?style=flat)](https://cocoapods.org/pods/DiyalogEngine)
[![License](https://img.shields.io/cocoapods/l/DiyalogEngine.svg?style=flat)](https://cocoapods.org/pods/DiyalogEngine)
[![Platform](https://img.shields.io/cocoapods/p/DiyalogEngine.svg?style=flat)](https://cocoapods.org/pods/DiyalogEngine)

## Installation

Simply add the following line to your Podfile by updating \<version no> to the desired version.


```ruby
pod 'DiyalogEngine', :git => 'https://github.com/diyalog-im/DiyalogEngine.git', :tag => '<version no>'
```

DiyalogEngine also needs following frameworks. Therefore, you will need to add them to your podfile.

```ruby
pod 'j2objc', :git => 'https://github.com/diyalog-im/j2objc.git', :tag => '1.0.2'
pod 'WebRTC', :git => 'https://github.com/diyalog-im/WebRTC.git', :tag => '1.1.2940'
```

When adding this frameworks to your podfile. You need add following post script at the ned of podfile. please do not forget to change <Your-Targer-Name> with your real target name.

```ruby
post_install do |installer|
    installer.pods_project.targets.each do |target|
    if target.name == "Pods-<“Your-Target-Name>
        target.build_configurations.each do |config|
        xcconfig_path = config.base_configuration_reference.real_path
        xcconfig = File.read(xcconfig_path)
        xcconfig.sub!('-framework "j2objc"', '')

        File.open(xcconfig_path, "w") do |file|
            file << xcconfig
        end
        end
    end
    end
end
```

## Author

Diyalog Yazılım Teknolojileri Ltd. Şti.

## License

DiyalogEngine is available under the MIT license. See the LICENSE file for more info.
