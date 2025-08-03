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
        // This ensures the output directory exists before writing files
        if !fileManager.fileExists(atPath: outputDirectory) {
            try fileManager.createDirectory(atPath: outputDirectory, withIntermediateDirectories: true)
        }
        
        // Write the generated code to the file
        let filePath = "\(outputDirectory)/\(filename)"
        try content.write(toFile: filePath, atomically: true, encoding: .utf8)
        print("✅ Generated file: \(filePath)")
    }
    
    //MARK: - Hummingbird Mustache
    public func generateWithSwiftMustache() {
        let structData = StructData.user()

        // Generate Swift code using the Mustache template
        let generatedCode = Templates.generateStruct(from: structData.toDictionary())
        
        // Write the generated code to a file
        do {
            try writeToFile(generatedCode, filename: "User.swift")
        } catch {
            print("❌ Error writing file: \(error)")
        }
    }

    //MARK: - Swift Syntax
    public func generateWithSwiftSyntax() {
        
        // Create properties using the new SwiftSyntaxProperty model
        let properties = [
            SwiftSyntaxProperty(name: "id", type: "UUID"),
            SwiftSyntaxProperty.optional("name", type: "String"),
            SwiftSyntaxProperty.array("emails", type: "String"),
            SwiftSyntaxProperty(name: "age", type: "Int"),
            SwiftSyntaxProperty.optional("phoneNumber", type: "String")
        ]
        
        do {
            // Generate and write to file using the new method
            try SwiftSyntaxGenerator.generateStructFile(
                name: "Person",
                properties: properties,
                filename: "Person.swift"
            )
        } catch {
            print("❌ Error generating SwiftSyntax file: \(error)")
        }
    }
    
    // MARK: - Swift Syntax with Shared File Helper
    /// Generates Swift struct using SwiftSyntax and writes to file using shared helper
    public func generateSwiftSyntaxWithSharedHelper() {
        let properties = [
            SwiftSyntaxProperty(name: "id", type: "UUID"),
            SwiftSyntaxProperty.optional("name", type: "String"),
            SwiftSyntaxProperty.array("emails", type: "String"),
            SwiftSyntaxProperty(name: "age", type: "Int"),
            SwiftSyntaxProperty.optional("phoneNumber", type: "String")
        ]
        
        // Generate Swift code using SwiftSyntax
        let generatedSyntax = SwiftSyntaxGenerator.generateStructSyntax(
            name: "Person",
            properties: properties
        )
        let swiftCode = generatedSyntax.formatted().description
        
        // Write using shared file helper for consistency
        do {
            try writeToFile(swiftCode, filename: "PersonWithHelper.swift")
        } catch {
            print("❌ Error writing SwiftSyntax file: \(error)")
        }
    }
    
    // MARK: - Batch Generation
    /// Generates multiple structs at once using different approaches
    public func generateAllStructs() {
        print("🚀 Starting batch code generation...")
        
        // Generate using Mustache templates
        generateWithSwiftMustache()
        
        // Generate using SwiftSyntax
        generateWithSwiftSyntax()
        
        // Generate predefined structs
        do {
            try SwiftSyntaxGenerator.generatePersonStruct()
            try SwiftSyntaxGenerator.generateProductStruct()
        } catch {
            print("❌ Error generating predefined structs: \(error)")
        }
        
        print("✨ Batch generation completed!")
    }
    
    
}

