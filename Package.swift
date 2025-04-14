// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftGenerator",
    platforms: [
         .macOS(.v12) 
     ],
    products: [
        .executable(
                name: "SwiftGeneratorExecutable",
                targets: ["SwiftGeneratorExecutable"]
            ),
        
        .library(
            name: "SwiftGenerator",
            targets: ["SwiftGenerator"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hummingbird-project/hummingbird-mustache.git", from: "1.0.3"),
        .package(url: "https://github.com/apple/swift-syntax.git", from: "510.0.2"),
        .package(url: "https://github.com/apple/swift-openapi-generator", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-openapi-runtime", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-openapi-urlsession", from: "1.0.0"),
    ],
    targets: [
        .target(name: "SwiftGenerator" , dependencies: [
            .product(name: "HummingbirdMustache", package: "hummingbird-mustache"),
            .product(name: "SwiftSyntax", package: "swift-syntax"),
            .product(name: "SwiftSyntaxBuilder", package: "swift-syntax"),
            .product(name: "OpenAPIGenerator", package: "swift-openapi-generator"),
            .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
            .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession"),
        ]),
        .executableTarget(
            name: "SwiftGeneratorExecutable",
            dependencies: [
                .byName(name: "SwiftGenerator"),
            ]
        ),
        .testTarget(
            name: "SwiftGeneratorTests",
            dependencies: ["SwiftGenerator"]
        ),
    ]
)
