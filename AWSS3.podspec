Pod::Spec.new do |s|
  s.name         = 'AWSS3'
  s.version      = '2.27.11'
  s.summary      = 'Amazon Web Services SDK for iOS.'

  s.description  = 'The AWS SDK for iOS provides a library, code samples, and documentation for developers to build connected mobile applications using AWS.'

  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.platform     = { :ios => "9.0", :watchos => "8.0" }
  s.watchos.deployment_target = '8.0'
  s.source       = { :git => 'https://github.com/KennethFra/aws-sdk-ios',
                     :tag => s.version}
  s.requires_arc = true
  s.dependency 'AWSCore', '2.27.10'
  s.source_files = 'AWSS3/*.{h,m}'
end
