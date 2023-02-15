Pod::Spec.new do |s|
  s.name             = 'DatesMagic'
  s.version          = '0.0.1'
  s.summary          = 'A lib with handy Date extension for iOS'
  s.homepage         = 'https://github.com/nobond10/DatesMagic'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'nobond10' => 'nobond10@ya.ru' }
  s.source           = { :git => 'https://github.com/nobond10/DatesMagic.git', :tag => s.version.to_s }
  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/**'
end