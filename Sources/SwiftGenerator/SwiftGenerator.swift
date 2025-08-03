// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import HummingbirdMustache


public struct SwiftGenerator {
    public init() {}
    
    // MARK: - File Writing Helpers
    private func writeToFile(_ content: String, filename: String, directory: String = "Generated") throws {
        let fileManager = FileManager.default
        let currentDirectory = fileManager.currentDirectoryPath
        let outputDirectory = "\(currentDirectory)/\(directory)"
        
        // Create directory if it doesn't exist
        if !fileManager.fileExists(atPath: outputDirectory) {
            try fileManager.createDirectory(atPath: outputDirectory, withIntermediateDirectories: true)
        }
        
        let filePath = "\(outputDirectory)/\(filename)"
        try content.write(toFile: filePath, atomically: true, encoding: .utf8)
        print("✅ Generated file: \(filePath)")
    }
    
    
    
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
        
        do {
            try writeToFile(generatedCode, filename: "User.swift")
        } catch {
            print("❌ Error writing file: \(error)")
        }
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

