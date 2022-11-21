// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VDPin",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "VDPin", targets: ["VDPin"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "VDPin",
            dependencies: [
            ]
        )
    ]
)
