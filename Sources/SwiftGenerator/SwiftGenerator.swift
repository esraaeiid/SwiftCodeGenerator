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

