#
#  Be sure to run `pod spec lint PCComponentKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "PCComponentKit"
  s.version      = "0.0.2"
  s.summary      = "iOS常用的UI组件库"

  s.description  = "iOS常用的UI组件库"

  s.homepage     = "https://github.com/pclion/PCComponentKit"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  s.author             = "peichuang"
  # Or just: s.author    = "peichuang"
  # s.authors            = { "peichuang" => "" }
  # s.social_media_url   = "http://twitter.com/peichuang"

  # s.platform     = :ios
   s.platform     = :ios, "7.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/pclion/PCComponentKit.git", :tag => "0.0.2" }


  s.source_files  = "PCComponentKitDemo/PCComponentKit/*"

  # s.public_header_files = "Classes/**/*.h"

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

  # s.framework  = "SomeFramework"
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'
  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
