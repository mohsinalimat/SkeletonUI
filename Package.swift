// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "SkeletonUI",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "SkeletonUI",
            targets: ["SkeletonUI"]),
    ],
    targets: [
        .target(
            name: "SkeletonUI"),
        .testTarget(
            name: "SkeletonUITests",
            dependencies: ["SkeletonUI"]),
    ],
    swiftLanguageVersions: [.v5]
)
