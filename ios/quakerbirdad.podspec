#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint quakerbirdad.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'quakerbirdad'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin project.'
  s.description      = <<-DESC
  A new Flutter plugin project.
  DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.static_framework = true
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # KSAD
  s.frameworks = ["StoreKit","AdSupport","CoreLocation","SystemConfiguration","CoreTelephony","Security","AVFoundation","WebKit","AudioToolbox","CoreGraphics","CoreImage","CoreText","JavaScriptCore","MapKit","UIKit","MobileCoreServices","MediaPlayer","CoreMedia","CoreMotion","Accelerate","ImageIO","QuartzCore","Foundation","CoreData","AVKit","MessageUI","QuickLook","AddressBook","AppTrackingTransparency","CFNetwork","SafariServices","DeviceCheck"]
  s.libraries = ["z","xml2","c++abi","resolv.9","c++","sqlite3","bz2","iconv", "resolv.9","bz2.1.0"]
  s.vendored_frameworks = 'SDK/KSAdSDK.framework'
  s.dependency 'KSAdSDK', '3.3.53'
  s.dependency 'GDTMobSDK','4.14.45'
  s.dependency 'Ads-CN-Beta','5.7.0.2'
  s.dependency 'SigmobAd-iOS', '4.10.0'
  s.dependency 'BeiZiSDK/BeiZiSDK','4.90.1.40'
  s.dependency 'MintegralAdSDK/RewardVideoAd', '7.3.9'
  s.dependency 'MintegralAdSDK/NewInterstitialAd', '7.3.9'
  s.dependency 'MintegralAdSDK/SplashAd', '7.3.9'
  s.dependency 'MintegralAdSDK/BannerAd', '7.3.9'

  # MYAD
  s.frameworks = ["Foundation", "UIKit", "MobileCoreServices", "CoreGraphics", "Security", "SystemConfiguration", "CoreTelephony", "AdSupport", "CoreData", "StoreKit", "AVFoundation", "MediaPlayer", "CoreMedia", "WebKit", "Accelerate", "CoreLocation", "AVKit", "MessageUI", "QuickLook", "AudioToolBox", "JavaScriptCore", "CoreMotion"]
  s.libraries = ["z", "resolv.9", "sqlite3", "c++", "c++abi"]
 # s.source = { :http=>"https://static.yximgs.com/udata/pkg/KSAdSDKTarGz/KSAdSDK-framework-content-3.3.32-1260.tar.gz" }
  s.source = { :path=>"SDK/MYAdSdk/" }
  s.vendored_libraries = 'SDK/MYAdSdk/libmysdk.a'

  
  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386'}

end
