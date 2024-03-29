// swift-tools-version: 5.8
// swiftlint:disable explicit_acl explicit_top_level_acl

import PackageDescription

let package = Package(
  name: "FelinePine",
  platforms: [.iOS(.v14), .watchOS(.v7), .macOS(.v11)],
  products: [
    .library(
      name: "FelinePine",
      targets: ["FelinePine"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0")
  ],
  targets: [
    .target(
      name: "FelinePine",
      dependencies: [
        .product(
          name: "Logging",
          package: "swift-log",
          condition: .when(platforms: [.linux, .android, .wasi, .windows])
        )
      ],
      swiftSettings: [
        SwiftSetting.enableUpcomingFeature("BareSlashRegexLiterals"),
        SwiftSetting.enableUpcomingFeature("ConciseMagicFile"),
        SwiftSetting.enableUpcomingFeature("ExistentialAny"),
        SwiftSetting.enableUpcomingFeature("ForwardTrailingClosures"),
        SwiftSetting.enableUpcomingFeature("ImplicitOpenExistentials"),
        SwiftSetting.enableUpcomingFeature("StrictConcurrency"),
        SwiftSetting.enableUpcomingFeature("DisableOutwardActorInference"),
        SwiftSetting.enableExperimentalFeature("StrictConcurrency")
      ]
    ),
    .testTarget(
      name: "FelinePineTests",
      dependencies: ["FelinePine"]
    )
  ]
)
// swiftlint:enable explicit_acl explicit_top_level_acl
