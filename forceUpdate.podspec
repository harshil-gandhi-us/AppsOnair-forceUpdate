#
# Be sure to run `pod lib lint forceUpdate.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'forceUpdate'
  s.version          = '0.1.0'
  s.summary          = 'A short description of forceUpdate.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/harshil-gandhi-us/forceUpdate'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'harshil-gandhi-us' => 'harshil.gandhi@logicwind.com' }
  s.source           = { :git => 'https://github.com/harshil-gandhi-us/forceUpdate.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  # s.source_files = 'forceUpdate/Classes/**/*'

  s.dependency 'AppsOnAirIOSCore'
  s.dependency 'iOSDropDown'
  s.dependency 'Toast-Swift'

  s.subspec 'ForceUpdate' do |forceUpdate|   # ForceUpdate is sub Pod Name & forceUpdate is alieas nane of sub pod 
      forceUpdate.source_files = 'Sources/ForceUpdate/Classes/**/*' # for access provide all the class inside ForceUpdate
      forceUpdate.resources = ['Sources/ForceUpdate/Assets/AppUpdate.storyboard'] # for access SwiftUI  inside ForceUpdate
  end
    
  s.subspec 'DeepLink' do |deepLink|    # DeepLink is second sub Pod Name & deepLink is second alieas nane of sub pod 
        deepLink.source_files = 'Sources/DeepLink/**/*'  # for access provide all the class inside second sub pod
  end
  
  # s.resource_bundles = {
  #   'forceUpdate' => ['forceUpdate/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
