# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target 'Ditto' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Ditto
pod 'SwiftyJSON'
pod 'UIImageColors'
pod 'SCLAlertView'
pod 'Alamofire'
pod 'Moya'
pod 'ObjectMapper'
pod 'AlamofireImage'
pod 'Moya-ObjectMapper'
pod 'ReachabilitySwift'
pod 'IQKeyboardManagerSwift'
pod 'GoogleMaps'
pod 'GooglePlaces'
pod 'SlideMenuControllerSwift'
pod 'FacebookCore'
pod 'FacebookLogin'
pod 'FacebookShare'
pod 'Firebase/Core'
pod 'Firebase/Messaging'
pod 'Firebase/Crash'
pod 'SwiftyGif'
pod 'CHIPageControl', '~> 0.1.3'
pod 'CHIPageControl/Aleppo'
pod 'TextFieldEffects'


end

post_install do |installer|
installer.pods_project.targets.each do |target|
target.build_configurations.each do |config|
config.build_settings['SWIFT_VERSION'] = '3.0'
end
end
end
