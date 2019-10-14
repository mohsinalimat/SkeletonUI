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
            targets: ["SkeletonUI"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Realm/SwiftLint", from: "0.35.0"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.40.13"),
        .package(url: "https://github.com/shibapm/Komondor", from: "1.0.4"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.6.0")
    ],
    targets: [
        .target(
            name: "SkeletonUI"
        ),
        .testTarget(
            name: "SnapshotTests",
            dependencies: ["SkeletonUI", "SnapshotTesting"]
        ),
        .testTarget(
            name: "UnitTests",
            dependencies: ["SkeletonUI"]
        )
    ],
    swiftLanguageVersions: [.v5]
)

#if canImport(PackageConfig)
    import PackageConfig

    let config = PackageConfig([
        "komondor": [
            "pre-commit": [
                "swift test",
                "swift run swiftformat .",
                "swift run swiftlint autocorrect",
                "git add ."
            ],
            "pre-push": "swift test"
        ]
    ])
#endif
