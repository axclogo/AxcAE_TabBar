#
#  Be sure to run `pod spec lint AxcAE_TabBar.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

    s.name         = "AxcAE_TabBar"

    s.version      = "1.0.1"

    s.summary      = "A special effects TabBar component that opens many apis -- AxcAE_TabBar."

    s.ios.deployment_target = '8.0'

    s.homepage     = "https://github.com/axclogo/AxcAE_TabBar"

    s.license              = { :type => "MIT", :file => "LICENSE" }

    s.author             = { "赵新" => "axclogo@163.com" }

    s.social_media_url   = "http://www.cnblogs.com/axclogo/"

    s.source       = { :git => "https://github.com/axclogo/AxcAE_TabBar.git", :tag => s.version }

    s.source_files  = 'AxcAE_TabBar/AxcAE_TabBar/**/*'
 
    s.requires_arc = true


end
