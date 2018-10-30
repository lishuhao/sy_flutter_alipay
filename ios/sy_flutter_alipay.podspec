#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'sy_flutter_alipay'
  s.version          = '0.0.1'
  s.summary          = 'flutter 支付宝插件'
  s.description      = <<-DESC
flutter 支付宝插件
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'AlipaySDK-iOS'
  
  s.ios.deployment_target = '8.0'
end

