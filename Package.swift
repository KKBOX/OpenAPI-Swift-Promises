// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "KKBOXOpenAPISwiftPromises",
    products: [
        .library(
            name: "KKBOXOpenAPISwiftPromises",
            targets: ["KKBOXOpenAPISwiftPromises"]),
    ],
    dependencies: [
        .package(url: "https://github.com/google/promises.git", from: "1.0.0"),
        .package(url: "https://github.com/KKBOX/OpenAPI-Swift", .upToNextMinor(from: "1.1.2"))
    ],
    targets: [
        .target(
            name: "KKBOXOpenAPISwiftPromises",
            dependencies: ["Promises", "KKBOXOpenAPISwift"]),
        .testTarget(
            name: "KKBOXOpenAPISwiftPromisesTests",
            dependencies: ["KKBOXOpenAPISwiftPromises"]),
    ]
)
