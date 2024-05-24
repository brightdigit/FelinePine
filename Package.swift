// swift-tools-version: 6.0
// swiftlint:disable explicit_acl explicit_top_level_acl

import PackageDescription

let swiftSettings: [SwiftSetting] = [
  SwiftSetting.enableExperimentalFeature("AccessLevelOnImport"),
  SwiftSetting.enableExperimentalFeature("BitwiseCopyable"),
  SwiftSetting.enableExperimentalFeature("GlobalActorIsolatedTypesUsability"),
  SwiftSetting.enableExperimentalFeature("IsolatedAny"),
  SwiftSetting.enableExperimentalFeature("MoveOnlyPartialConsumption"),
  SwiftSetting.enableExperimentalFeature("NestedProtocols"),
  SwiftSetting.enableExperimentalFeature("NoncopyableGenerics"),
  SwiftSetting.enableExperimentalFeature("RegionBasedIsolation"),
  SwiftSetting.enableExperimentalFeature("TransferringArgsAndResults"),
  SwiftSetting.enableExperimentalFeature("VariadicGenerics"),

  SwiftSetting.enableUpcomingFeature("FullTypedThrows"),
  SwiftSetting.enableUpcomingFeature("InternalImportsByDefault")

//  SwiftSetting.unsafeFlags([
//    "-Xfrontend",
//    "-warn-long-function-bodies=100"
//  ]),
//  SwiftSetting.unsafeFlags([
//    "-Xfrontend",
//    "-warn-long-expression-type-checking=100"
//  ])
]

let package = Package(
  name: "FelinePine",
  platforms: [.iOS(.v14), .watchOS(.v7), .macOS(.v11)],
  products: [
    .library(
      name: "FelinePine",
      targets: ["FelinePine"]
    )
  ],
  targets: [
    .target(
      name: "FelinePine",
      swiftSettings: swiftSettings
    ),
    .testTarget(
      name: "FelinePineTests",
      dependencies: ["FelinePine"]
    )
  ]
)
// swiftlint:enable explicit_acl explicit_top_level_acl
