
Pod::Spec.new do |s|
  s.name         = 'HATwinklingTagView'
  s.summary      = 'A twinkling tag for iOS.'
  s.version      = '0.2.0'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'HuaianWu' => '0@huaian.io' }
  s.social_media_url = 'https://huaian.io'
  s.homepage     = 'https://github.com/HuaianWu/HATwinklingTagView'
  s.platform     = :ios, '6.0'
  s.ios.deployment_target = '6.0'
  s.source       = { :git => 'https://github.com/HuaianWu/HATwinklingTagView.git', :tag => s.version.to_s }
  
  s.requires_arc = true
  s.source_files = 'HATwinklingTagView/*.{h,m}'
  s.public_header_files = 'HATwinklingTagView/*.{h}'
  
  s.frameworks = 'UIKit'
  end