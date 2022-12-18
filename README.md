# VDPin

[![CI Status](https://img.shields.io/travis/dankinsoid/VDPin.svg?style=flat)](https://travis-ci.org/dankinsoid/VDPin)
[![Version](https://img.shields.io/cocoapods/v/VDPin.svg?style=flat)](https://cocoapods.org/pods/VDPin)
[![License](https://img.shields.io/cocoapods/l/VDPin.svg?style=flat)](https://cocoapods.org/pods/VDPin)
[![Platform](https://img.shields.io/cocoapods/p/VDPin.svg?style=flat)](https://cocoapods.org/pods/VDPin)

## Description

This repository provides some convenience methods for creating constraints.


## Usage

1. Pin attributes of the view to a specified item or its superview.
```swift
view.pin(.edges)
view.pin(.leading)
view.pin(.edges(.horizontal), 16)
view.pin(edges(.top, .bottom), 10, to: safeAreaLayoutGuide)
view.pin(edges: [.top: 10, .horizontal: 5], to: safeAreaLayoutGuide)
// pin view after/before another view
rightView.pin(to: .trailing, of: leftView, options: .offset(10))
view.pin(.center, 10)
view.pin([.size: 100, .centerY: 10, .top: 20, .edges(.horizontal): 10])
```
2. Pin any attributes between two views
```swift
view.pin(.top, to: .centerY, of: anotherView)
```
3. Set aspect ratio of the view.
```swift
view.pin(aspectRatio: 2 / 3)
```
4. All pin methods contain a `with options` parameter.
```swift
view.pin(.edges, 10, options: .priority(.required))
```
options:
- `.priority(300)`: set the priority of the constraint
- `.offset(10)`: set the offset of the constraint
- `.multiplier(2)`: set the multiplier of the constraint
- `.relation(.greaterThanOrEqual)`, `.greaterThanOrEqual`, `.lessThanOrEqual`: set the relation of the constraint
- `.inactive`, `.activated(false)`: set the active state of the constraint
- `.update`: update the constraint if it already exists
- `.translatesAutoresizingMask`: don't change `translatesAutoresizingMaskIntoConstraints` property
- `.safeArea`: use `safeAreaLayoutGuide` instead of `superview` as default second item
5. All these methods can be chained
```swift
view
    .pin(.edges(.horizontal), 10)
    .pin(to: .bottom, of: anotherView.pin(.height, 50), options: .offset(20))
    .pin(.size, 100)
```
6. Use `PartialRangeThrough` and `PartialRangeFrom` for offset value
```swift
view.pin(.bottom, 10..., with: .safeArea)
view.pin(to: .bottom, of: anotherView, options: .offset(...10))
```
7. All these methods return `Constraints` object, that can be used for updating constraints.

 
## Installation
1. [Swift Package Manager](https://github.com/apple/swift-package-manager)

Create a `Package.swift` file.
```swift
// swift-tools-version:5.7
import PackageDescription

let package = Package(
  name: "SomeProject",
  dependencies: [
    .package(url: "https://github.com/dankinsoid/VDPin.git", from: "1.7.0")
  ],
  targets: [
    .target(name: "SomeProject", dependencies: ["VDPin"])
  ]
)
```
```ruby
$ swift build
```
2.  [CocoaPods](https://cocoapods.org)

Add the following line to your Podfile:
```ruby
pod 'VDPin'
```
and run `pod update` from the podfile directory first.

## Author

dankinsoid, voidilov@gmail.com

## License

VDPin is available under the MIT license. See the LICENSE file for more info.
