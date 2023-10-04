# Uncomment the next line to define a global platform for your project
 platform :ios, '9.0'

target 'onedayticket-ios' do
  use_frameworks!
  pod 'Kingfisher', '~> 7.0'
  pod 'NYAlertViewController'
  pod 'NVActivityIndicatorView'
  pod 'Alamofire'
end
post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
            end
        end
    end
end
