#
# Be sure to run `pod lib lint SwiftyReview.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name					= 'SwiftyReview'
  s.version					= '0.2.1'
  s.summary					= 'Simple and easy way to request App Reviews for iOS, tvOS, & macOS'
  s.description				= <<-DESC
SwiftyReview is an open source cross-platform app review framework for iOS, tvOS, & macOS.
							DESC
  s.homepage				= 'https://bitbucket.org/ericconnerapps/swiftyreview'
  s.license					= { :type => 'MIT', :file => 'LICENSE' }
  s.author					= { 'Eric Conner' => 'eric@ericconnerapps.com' }
  s.source					= { :git => 'https://bitbucket.org/ericconnerapps/swiftyreview.git', :tag => s.version.to_s }
  s.social_media_url		= 'https://twitter.com/ericconnerapps'
  s.ios.deployment_target	= '9.1'
  #s.tvos.deployment_target	= '9.0'
  s.osx.deployment_target	= '10.14'
  s.source_files			= 'Sources/**/*.{h,swift}'
  s.requires_arc			= true
  s.swift_version			= '4.0'
  s.pod_target_xcconfig		= { 'SWIFT_VERSION' => '4.0' }
end
