// swift-tools-version:5.7.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XRPLSwift",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v5)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "XRPLSwift",
            targets: ["XRPLSwift"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/Boilertalk/secp256k1.swift.git", from: "0.1.6"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.5.1"),
        .package(url: "https://github.com/attaswift/BigInt.git", from: "5.0.0"),
        .package(url: "https://github.com/Flight-School/AnyCodable.git", from: "0.4.0"),
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.24.0"),
        .package(url: "https://github.com/vapor/websocket-kit.git", from: "2.6.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        .binaryTarget(
            name: "SwiftLintBinary",
            url: "https://github.com/realm/SwiftLint/releases/download/0.48.0/SwiftLintBinary-macos.artifactbundle.zip",
            checksum: "9c255e797260054296f9e4e4cd7e1339a15093d75f7c4227b9568d63edddba50"
        ),
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "XRPLSwift",
            dependencies: [
                .product(name: "WebSocketKit", package: "websocket-kit"),
                .product(name: "NIO", package: "swift-nio"),
                .product(name: "secp256k1", package: "secp256k1.swift"),
                "AnyCodable",
                "CryptoSwift",
                "BigInt"
            ]
        ),
        .testTarget(
            name: "XRPLSwiftUTests",
            dependencies: ["XRPLSwift"]
        ),
        .testTarget(
            name: "XRPLSwiftITests",
            dependencies: ["XRPLSwift"]
        )
    ]
)
