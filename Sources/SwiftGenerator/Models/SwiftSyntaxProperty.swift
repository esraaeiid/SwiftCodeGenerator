//
//  SwiftSyntaxProperty.swift
//  SwiftGenerator
//
//  Created by Esraa Eid on 28/03/2025.
//

import Foundation

// MARK: - Swift Syntax Property Model
/// Represents a property in a Swift struct with type information
/// This model is used by the SwiftSyntax generator to define struct properties
/// with support for optional types, arrays, and various Swift type mappings
public struct SwiftSyntaxProperty {
    let name: String
    let type: String
    let isOptional: Bool
    let isArray: Bool
    
    /// Initialize a SwiftSyntaxProperty with basic type information
    /// - Parameters:
    ///   - name: The property name (e.g., "id", "name", "email")
    ///   - type: The Swift type (e.g., "String", "Int", "UUID")
    ///   - isOptional: Whether the property is optional (default: false)
    ///   - isArray: Whether the property is an array (default: false)
    public init(name: String, type: String, isOptional: Bool = false, isArray: Bool = false) {
        self.name = name
        self.type = type
        self.isOptional = isOptional
        self.isArray = isArray
    }
    
    /// Convenience initializer for optional properties
    /// - Parameters:
    ///   - name: The property name
    ///   - type: The Swift type
    /// - Returns: A SwiftSyntaxProperty with isOptional set to true
    public static func optional(_ name: String, type: String) -> SwiftSyntaxProperty {
        return SwiftSyntaxProperty(name: name, type: type, isOptional: true)
    }
    
    /// Convenience initializer for array properties
    /// - Parameters:
    ///   - name: The property name
    ///   - type: The Swift type (element type of the array)
    /// - Returns: A SwiftSyntaxProperty with isArray set to true
    public static func array(_ name: String, type: String) -> SwiftSyntaxProperty {
        return SwiftSyntaxProperty(name: name, type: type, isArray: true)
    }
    
    /// Convenience initializer for optional array properties
    /// - Parameters:
    ///   - name: The property name
    ///   - type: The Swift type (element type of the array)
    /// - Returns: A SwiftSyntaxProperty with both isOptional and isArray set to true
    public static func optionalArray(_ name: String, type: String) -> SwiftSyntaxProperty {
        return SwiftSyntaxProperty(name: name, type: type, isOptional: true, isArray: true)
    }
}
