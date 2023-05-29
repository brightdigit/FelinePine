// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let swiftSettings: [SwiftSetting] = [
   .enableUpcomingFeature("BareSlashRegexLiterals"),
   .enableUpcomingFeature("ConciseMagicFile"),
   .enableUpcomingFeature("ExistentialAny"),
   .enableUpcomingFeature("ForwardTrailingClosures"),
   .enableUpcomingFeature("ImplicitOpenExistentials"),
   .enableUpcomingFeature("StrictConcurrency"),
   .unsafeFlags(["-warn-concurrency", "-enable-actor-data-race-checks"]),
]

let package = Package(
    name: "FelinePine",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FelinePine",
            targets: ["FelinePine"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FelinePine",
             swiftSettings: swiftSettings),
        .testTarget(
            name: "FelinePineTests",
            dependencies: ["FelinePine"]),
    ]
)
