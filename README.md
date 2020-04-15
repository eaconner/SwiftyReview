# SwiftyReview
[![Version](https://img.shields.io/cocoapods/v/SwiftyReview.svg?style=flat)](http://cocoapods.org/pods/SwiftyReview)
[![License](https://img.shields.io/cocoapods/l/SwiftyReview.svg?style=flat)](http://cocoapods.org/pods/SwiftyReview)
[![Platform](https://img.shields.io/cocoapods/p/SwiftyReview.svg?style=flat)](http://cocoapods.org/pods/SwiftyReview)

## Example
To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation
### Manual
Just drop the **SwiftyReview.swift** file into your project. That's it!

### CocoaPods
[CocoaPods] is a dependency manager for Cocoa projects. To install SwiftyRadio with CocoaPods:

* Make sure CocoaPods is [installed][CocoaPods Installation].
* Update your Podfile to include the following:
```
	use_frameworks!
	pod 'SwiftyReview'
```
* Run `pod install`.
* In your code import SwiftyRadio like so:
```swift
	import SwiftyReview
```

### Swift Package Manager
The [Swift Package Manager] is a tool for managing the distribution of Swift code.

* Update your `Package.swift` file to include the following:
```swift
	import PackageDescription

	let package = Package(
		name: "My App",
		dependencies: [
			.Package(url: "https://github.com/EricConnerApps/SwiftyReview.git"),
		]
	)
```
* Run `swift build`.

## Changelog
All notable changes to this project will be documented in [CHANGELOG.md].

## License
SwiftyReview is available under the MIT license. See the [LICENSE] file for more info.

## Want to help?
Got a bug fix, or a new feature? Create a pull request and go for it!

## Let me know!
If you use SwiftyReview, please let me know about your app.

[CHANGELOG.md]: https://bitbucket.org/ericconnerapps/swiftyreview/src/master/CHANGELOG.md
[LICENSE]: https://bitbucket.org/ericconnerapps/swiftyreview/src/master/LICENSE
[Swift Package Manager]: https://swift.org/package-manager/
[CocoaPods]: https://cocoapods.org
[CocoaPods Installation]: https://guides.cocoapods.org/using/getting-started.html#getting-started
