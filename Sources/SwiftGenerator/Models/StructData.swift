//
//  StructData.swift
//  SwiftGenerator
//
//  Created by Esraa Eid on 28/03/2025.
//

import Foundation

// MARK: - Mustache Struct Data Model
/// Represents a complete Swift struct definition for Mustache template generation
/// This model organizes struct information including name and properties,
/// and provides conversion to dictionary format for Mustache template processing
public struct StructData {
    let name: String
    let properties: [Property]
    
    /// Initialize a StructData with name and properties
    /// - Parameters:
    ///   - name: The struct name (e.g., "User", "Person")
    ///   - properties: Array of Property objects defining the struct fields
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

// MARK: - Convenience Initializers
extension StructData {
    
    /// Create a User struct with typical user properties
    /// - Returns: StructData representing a User struct
    /// 
    /// Generated struct:
    /// ```swift
    /// struct User: Codable {
    ///     let id: Int
    ///     let name: String?
    ///     let emails: [String]
    /// }
    /// ```
    public static func user() -> StructData {
        return StructData(
            name: "User",
            properties: [
                Property(variable: "id", type: "Int"),
                Property.optional("name", type: "String"),
                Property.array("emails", type: "String")
            ]
        )
    }
    
    /// Create a Person struct with comprehensive person properties
    /// - Returns: StructData representing a Person struct
    /// 
    /// Generated struct:
    /// ```swift
    /// struct Person: Codable {
    ///     let id: UUID
    ///     let firstName: String?
    ///     let lastName: String?
    ///     let phoneNumbers: [String]
    ///     let age: Int
    /// }
    /// ```
    public static func person() -> StructData {
        return StructData(
            name: "Person",
            properties: [
                Property(variable: "id", type: "UUID"),
                Property.optional("firstName", type: "String"),
                Property.optional("lastName", type: "String"),
                Property.array("phoneNumbers", type: "String"),
                Property(variable: "age", type: "Int")
            ]
        )
    }
} 