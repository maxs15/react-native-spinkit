#
#  Be sure to run `pod spec lint react-native-aws-cognito-js.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#
require "json"
package = JSON.parse(File.read(File.join(__dir__, '../', 'package.json')))

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = package['name']
  s.version      = package["version"]
  s.summary      = package['description']
  
  s.platform      = :ios, '7.0'
  # s.requires_arc  = true

  s.homepage     = package["homepage"]
  s.license      = package["license"]


  s.author       = { "Maxime Mezrahi" => "maxime.mezrahi@gmail.com" }
  s.source       = { :git => "https://github.com/maxs15/react-native-spinkit.git" }

  s.source_files  = "*.{h,m}"
  
  s.dependency "SpinKit"
  s.dependency "React"
end
