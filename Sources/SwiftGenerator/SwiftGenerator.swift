// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import HummingbirdMustache


public struct SwiftGenerator {
    public init() {}
    
    //MARK: - Hummingbird Mustache
    public func generateWithSwiftMustache() {
        let data: [String: Any] = [
            "name": "User",
            "properties": [
                [
                    "variable": "id",
                    "type": "Int",
                    "isOptional": false,
                    "isArray": false
                ],
                [
                    "variable": "name",
                    "type": "String",
                    "isOptional": true,
                    "isArray": false
                ],
                [
                    "variable": "email",
                    "type": "String",
                    "isOptional": false,
                    "isArray": true
                ]
            ]
        ]

        let generatedCode = Templates.generateStruct(from: data)
        print(generatedCode)
    }

    //MARK: - Swift Syntax
    public func generateWithSwiftSyntax() {
        
        let generatedSyntax = SwiftSyntaxGenerator.generateStructSyntax(
            name: "Person",
            properties: [
                ("name", "String?"),
                ("age", "[Int]"),
                ("email", "String")
            ]
        )
        print(generatedSyntax)
    }
    
    
}

