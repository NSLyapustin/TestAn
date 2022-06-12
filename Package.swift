// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TestAn",
    products: [
        .executable(name: "testan", targets: ["TestAn"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.4.6"),
        .package(url: "https://github.com/bannzai/XcodeProject", from: "1.0.0")
    ],
    targets: [
        .target(name: "TestAn", dependencies: [
            .product(name: "ArgumentParser", package: "swift-argument-parser"),
            .product(name: "XcodeProject", package: "XcodeProject")
        ]),
        .testTarget(name: "TestAnTests", dependencies: ["TestAn"]),
    ]
)
