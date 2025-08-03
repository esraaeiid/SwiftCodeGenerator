// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftGenerator",
    
    // MARK: - Platform Requirements
    // Specifies that this package requires macOS 12.0 or later
    // This ensures compatibility with the required Swift and dependency versions
    platforms: [
         .macOS(.v12) 
     ],
    
    // MARK: - Products
    // Defines what this package provides to consumers
    products: [
        // Executable: Command-line tool that can be run directly
        .executable(
                name: "SwiftGeneratorExecutable",
                targets: ["SwiftGeneratorExecutable"]
            ),
        
        // Library: Can be imported and used by other Swift packages/apps
        .library(
            name: "SwiftGenerator",
            targets: ["SwiftGenerator"]),
    ],
    
    // MARK: - Dependencies
    // External packages this project depends on
    dependencies: [
        // Hummingbird Mustache: Template engine for generating Swift code
        .package(url: "https://github.com/hummingbird-project/hummingbird-mustache.git", from: "1.0.3"),
        
        // Swift Syntax: Apple's official library for parsing and generating Swift code
        .package(url: "https://github.com/apple/swift-syntax.git", from: "510.0.2"),
        
        // OpenAPI Generator: Generate Swift code from OpenAPI specifications
        .package(url: "https://github.com/apple/swift-openapi-generator", from: "1.0.0"),
        
        // OpenAPI Runtime: Runtime support for OpenAPI-generated code
        .package(url: "https://github.com/apple/swift-openapi-runtime", from: "1.0.0"),
        
        // OpenAPI URLSession: HTTP client integration for OpenAPI
        .package(url: "https://github.com/apple/swift-openapi-urlsession", from: "1.0.0"),
    ],
    
    // MARK: - Targets
    // Defines the modules/components of this package
    targets: [
        // Main library target: Contains the core SwiftGenerator functionality
        .target(name: "SwiftGenerator" , dependencies: [
            .product(name: "HummingbirdMustache", package: "hummingbird-mustache"),
            
            // Swift code parsing and generation
            .product(name: "SwiftSyntax", package: "swift-syntax"),
            .product(name: "SwiftSyntaxBuilder", package: "swift-syntax"),
            
            // OpenAPI integration for API-driven code generation
            .product(name: "OpenAPIGenerator", package: "swift-openapi-generator"),
            .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
            .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession"),
        ]),
        
        // Executable target: Command-line interface for the generator
        .executableTarget(
            name: "SwiftGeneratorExecutable",
            dependencies: [
                // Depends on the main SwiftGenerator library
                .byName(name: "SwiftGenerator"),
            ]
        ),
        
        // Test target: Unit tests for the SwiftGenerator library
        .testTarget(
            name: "SwiftGeneratorTests",
            dependencies: ["SwiftGenerator"]
        ),
    ]
)
