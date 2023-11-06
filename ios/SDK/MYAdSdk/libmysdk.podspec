Pod::Spec.new do |s|
  s.name = "libmysdk"
  s.version = "4.3.0"
  s.summary = "libmysdk."
  s.authors = {"lfc"=>"lfc001@126.com"}
  s.homepage = "http://101.37.27.69:8091"
  s.frameworks = ["StoreKit","AdSupport","CoreLocation","SystemConfiguration","CoreTelephony","Security","AVFoundation","WebKit","AudioToolbox","CoreGraphics","CoreImage","CoreText","JavaScriptCore","MapKit","UIKit","MobileCoreServices","MediaPlayer","CoreMedia","CoreMotion","Accelerate","ImageIO","QuartzCore","Foundation","CoreData","AVKit","MessageUI","QuickLook","AddressBook","AppTrackingTransparency","CFNetwork","SafariServices","DeviceCheck"]
  s.libraries = ["z","xml2","c++abi","resolv.9","c++","sqlite3","bz2","iconv", "resolv.9","bz2.1.0"]
  s.source = { :path => '.' }
  s.public_header_files = '*.h'
  s.ios.deployment_target    = '11.0'
  s.ios.vendored_libraries   = 'libmysdk.a'
  
  
    s.dependency 'KSAdSDK', '3.3.53'
    s.dependency 'GDTMobSDK','4.14.45'
    s.dependency 'Ads-CN-Beta','5.7.0.2'
    s.dependency 'SigmobAd-iOS', '4.10.0'
    s.dependency 'BeiZiSDK/BeiZiSDK','4.90.1.40'
    s.dependency 'MintegralAdSDK/RewardVideoAd', '7.3.9'
    s.dependency 'MintegralAdSDK/NewInterstitialAd', '7.3.9'
    s.dependency 'MintegralAdSDK/SplashAd', '7.3.9'
    s.dependency 'MintegralAdSDK/BannerAd', '7.3.9'
  
end

