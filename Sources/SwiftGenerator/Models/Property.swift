//
//  Property.swift
//  SwiftGenerator
//
//  Created by Esraa Eid on 28/03/2025.
//

import Foundation

// MARK: - Mustache Property Model
/// Represents a property in a Swift struct for Mustache template generation
/// This model is used to define struct properties that will be processed by
/// the Hummingbird Mustache template engine to generate Swift code
public struct Property {
    let variable: String
    let type: String
    let isOptional: Bool
    let isArray: Bool
    
    /// Initialize a Property with basic type information
    /// - Parameters:
    ///   - variable: The property name (e.g., "id", "name", "email")
    ///   - type: The Swift type (e.g., "String", "Int", "UUID")
    ///   - isOptional: Whether the property is optional (default: false)
    ///   - isArray: Whether the property is an array (default: false)
    public init(variable: String, type: String, isOptional: Bool = false, isArray: Bool = false) {
        self.variable = variable
        self.type = type
        self.isOptional = isOptional
        self.isArray = isArray
    }
}

// MARK: - Convenience Initializers
extension Property {
    
    /// Create an optional property
    /// - Parameters:
    ///   - variable: The property name
    ///   - type: The Swift type
    /// - Returns: A Property with isOptional set to true
    /// 
    /// Example: Property.optional("name", type: "String") generates "let name: String?"
    public static func optional(_ variable: String, type: String) -> Property {
        return Property(variable: variable, type: type, isOptional: true)
    }
    
    public static func array(_ variable: String, type: String) -> Property {
        return Property(variable: variable, type: type, isArray: true)
    }
    
    /// Create an optional array property
    /// - Parameters:
    ///   - variable: The property name
    ///   - type: The Swift type (element type of the array)
    /// - Returns: A Property with both isOptional and isArray set to true
    /// 
    /// Example: Property.optionalArray("tags", type: "String") generates "let tags: [String]?"
    public static func optionalArray(_ variable: String, type: String) -> Property {
        return Property(variable: variable, type: type, isOptional: true, isArray: true)
    }
} 