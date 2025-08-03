//
//  SwiftSyntaxGenerator.swift
//  SwiftGenerator
//
//  Created by Esraa Eid on 28/03/2025.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import Foundation

// MARK: - Swift Syntax Generator
/// Generates Swift structs using Apple's SwiftSyntax library
/// This provides programmatic control over Swift code generation
public enum SwiftSyntaxGenerator {
    
    /// Generates Swift struct syntax from a name and array of properties
    /// - Parameters:
    ///   - name: The name of the struct to generate
    ///   - properties: Array of SwiftSyntaxProperty objects defining the struct properties
    /// - Returns: Generated Swift struct as DeclSyntax
    static func generateStructSyntax(name: String, properties: [SwiftSyntaxProperty]) -> DeclSyntax {
        let structDecl = StructDeclSyntax(
            modifiers: [.init(name: .keyword(.public))],
            structKeyword: .keyword(.struct),
            name: .identifier(name),
            inheritanceClause: InheritanceClauseSyntax {
                InheritedTypeListSyntax {
                    InheritedTypeSyntax(type: TypeSyntax("Codable"))
                }
            },
            memberBlock: MemberBlockSyntax {
                for property in properties {
                    VariableDeclSyntax(bindingSpecifier: .keyword(.let)) {
                        PatternBindingSyntax(
                            pattern: IdentifierPatternSyntax(identifier: .identifier(property.name)),
                            typeAnnotation: TypeAnnotationSyntax(
                                type: resolveType(from: property)
                            )
                        )
                    }
                }
            }
        )
        return DeclSyntax(structDecl)
    }
    
    /// Generates Swift struct and writes it to a file
    /// - Parameters:
    ///   - name: The name of the struct to generate
    ///   - properties: Array of SwiftSyntaxProperty objects
    ///   - filename: Name of the file to create (defaults to struct name + ".swift")
    ///   - directory: Directory to save the file (defaults to "Generated")
    /// - Throws: File system errors if writing fails
    static func generateStructFile(
        name: String, 
        properties: [SwiftSyntaxProperty], 
        filename: String? = nil,
        directory: String = "Generated"
    ) throws {
        let generatedSyntax = generateStructSyntax(name: name, properties: properties)
        let swiftCode = generatedSyntax.formatted().description
        
        let fileManager = FileManager.default
        let currentDirectory = fileManager.currentDirectoryPath
        let outputDirectory = "\(currentDirectory)/\(directory)"
        
        // Create directory if it doesn't exist
        if !fileManager.fileExists(atPath: outputDirectory) {
            try fileManager.createDirectory(atPath: outputDirectory, withIntermediateDirectories: true)
        }
        
        // Use provided filename or default to struct name
        let finalFilename = filename ?? "\(name).swift"
        let filePath = "\(outputDirectory)/\(finalFilename)"
        
        try swiftCode.write(toFile: filePath, atomically: true, encoding: .utf8)
        print("✅ Generated SwiftSyntax file: \(filePath)")
    }
    
    /// Resolves Swift type from property information
    /// - Parameter property: SwiftSyntaxProperty containing type information
    /// - Returns: TypeSyntax representing the Swift type
    private static func resolveType(from property: SwiftSyntaxProperty) -> TypeSyntax {
        var baseType = property.type
        
        // Handle array types
        if property.isArray {
            baseType = "[\(baseType)]"
        }
        
        // Handle optional types
        if property.isOptional {
            return TypeSyntax(OptionalTypeSyntax(wrappedType: TypeSyntax(stringLiteral: baseType)))
        } else {
            return TypeSyntax(stringLiteral: baseType)
        }
    }
    
    /// Legacy method for backward compatibility
    /// - Parameters:
    ///   - name: Struct name
    ///   - properties: Array of (name, type) tuples
    /// - Returns: Generated Swift struct as DeclSyntax
    static func generateStructSyntax(name: String, properties: [(String, String)]) -> DeclSyntax {
        // Convert tuple array to SwiftSyntaxProperty array
        let swiftProperties = properties.map { (name, type) in
            SwiftSyntaxProperty(name: name, type: type)
        }
        return generateStructSyntax(name: name, properties: swiftProperties)
    }
}

// MARK: - Convenience Methods
extension SwiftSyntaxGenerator {
    /// Generate a Person struct with common properties
    static func generatePersonStruct() throws {
        let properties = [
            SwiftSyntaxProperty(name: "id", type: "UUID"),
            SwiftSyntaxProperty.optional("firstName", type: "String"),
            SwiftSyntaxProperty.optional("lastName", type: "String"),
            SwiftSyntaxProperty.array("phoneNumbers", type: "String"),
            SwiftSyntaxProperty(name: "age", type: "Int"),
            SwiftSyntaxProperty.optional("email", type: "String")
        ]
        
        try generateStructFile(name: "Person", properties: properties)
    }
    
    /// Generate a Product struct with typical e-commerce properties
    static func generateProductStruct() throws {
        let properties = [
            SwiftSyntaxProperty(name: "id", type: "UUID"),
            SwiftSyntaxProperty(name: "name", type: "String"),
            SwiftSyntaxProperty.optional("description", type: "String"),
            SwiftSyntaxProperty(name: "price", type: "Double"),
            SwiftSyntaxProperty.array("tags", type: "String"),
            SwiftSyntaxProperty.optional("imageURL", type: "String"),
            SwiftSyntaxProperty(name: "inStock", type: "Bool")
        ]
        
        try generateStructFile(name: "Product", properties: properties)
    }
}

