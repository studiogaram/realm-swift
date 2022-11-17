Pod::Spec.new do |s|
  s.name                    = 'Realm'
  version                   = `sh build.sh get-version`
  s.version                 = version
  s.cocoapods_version       = '>= 1.10'
  s.summary                 = 'Realm is a modern data framework & database for iOS, macOS, tvOS & watchOS.'
  s.homepage                = "https://realm.io"
  s.source                  = { :http => 'http://github.com/studiogaram/Realm/releases/download/5.5.1/Realm.xcframework.zip' }
  s.author                  = { 'Realm' => 'help@realm.io' }
  s.license                 = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.frameworks              = 'Security'
  s.pod_target_xcconfig     = { 'APPLICATION_EXTENSION_API_ONLY' => 'YES',
                                'CLANG_CXX_LANGUAGE_STANDARD' => 'c++17',
                                'CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF' => 'NO',
                                'OTHER_CPLUSPLUSFLAGS' => '-isystem "${PODS_ROOT}/Realm/include/core" -fvisibility-inlines-hidden',
                                'OTHER_CPLUSPLUSFLAGS[arch=armv7]' => '-isystem "${PODS_ROOT}/Realm/include/core" -fvisibility-inlines-hidden -fno-aligned-new',
                                'USER_HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/Realm/include" "${PODS_ROOT}/Realm/include/Realm"',
                              }

  s.ios.deployment_target   = '9.0'
  s.ios.vendored_frameworks  = 'Realm.xcframework'

  s.subspec 'Headers' do |s|
    s.source_files          = public_header_files
    s.public_header_files   = public_header_files
  end
end
