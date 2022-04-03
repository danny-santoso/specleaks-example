# Uncomment the next line to define a global platform for your project
# platform :ios, '10.0'

target 'specleaks-example' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'SpecLeaks', :git => 'https://github.com/dannysantoso/specleaks.git', :branch => 'master'
  pod 'RxSwift'
  pod 'RxCocoa'

  target 'specleaks-exampleTests' do
    inherit! :search_paths
    pod 'SpecLeaks', :git => 'https://github.com/dannysantoso/specleaks.git', :branch => 'master'
    pod 'Quick'
    pod 'Nimble'
    pod 'RxBlocking'
    pod 'RxTest'
  end

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      if target.name == "Nimble"
        target.build_configurations.each do |config|
          xcconfig_path = config.base_configuration_reference.real_path
          xcconfig = File.read(xcconfig_path)
          new_xcconfig = xcconfig.sub('lswiftXCTest', 'lXCTestSwiftSupport')
          File.open(xcconfig_path, "w") { |file| file << new_xcconfig }
        end
      end
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '10.0'
        config.build_settings['SWIFT_VERSION'] = '5.0'
      end
    end
  end

end