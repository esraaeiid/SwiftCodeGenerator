// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import HummingbirdMustache


// MARK: - Models
public struct Property {
    let variable: String
    let type: String
    let isOptional: Bool
    let isArray: Bool
    
    public init(variable: String, type: String, isOptional: Bool = false, isArray: Bool = false) {
        self.variable = variable
        self.type = type
        self.isOptional = isOptional
        self.isArray = isArray
    }
}

public struct StructData {
    let name: String
    let properties: [Property]
    
    public init(name: String, properties: [Property]) {
        self.name = name
        self.properties = properties
    }
    
    // Convert to dictionary for Mustache template
    func toDictionary() -> [String: Any] {
        return [
            "name": name,
            "properties": properties.map { property in
                [
                    "variable": property.variable,
                    "type": property.type,
                    "isOptional": property.isOptional,
                    "isArray": property.isArray
                ]
            }
        ]
    }
}

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
        let structData = StructData(
            name: "User",
            properties: [
                Property(variable: "id", type: "Int"),
                Property(variable: "name", type: "String", isOptional: true),
                Property(variable: "email", type: "String", isArray: true)
            ]
        )

        let generatedCode = Templates.generateStruct(from: structData.toDictionary())
        
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

