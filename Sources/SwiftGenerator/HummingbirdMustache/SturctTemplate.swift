//
//  SturctTemplate.swift
//  SwiftGenerator
//
//  Created by Esraa Eid on 28/03/2025.
//

import Foundation

// MARK: - Mustache Template for Swift Struct Generation
// This template defines the structure for generating Swift structs with Codable conformance
// Mustache syntax allows for dynamic content insertion based on provided data
extension Templates {
    
    /// Mustache template for generating Swift structs
    /// This template creates a Swift struct with:
    /// - Codable conformance for JSON serialization
    /// - Dynamic properties based on the provided data
    /// - Support for optional and array types
    static let structTemplate = """
struct {{name}}: Codable {
    {{#properties}}
    let {{variable}}: {{#isArray}}[{{/isArray}}{{type}}{{#isOptional}}?{{/isOptional}}{{#isArray}}]{{/isArray}}
    {{/properties}}
}
"""
}

// MARK: - Template Syntax Explanation
/*
 Mustache Template Breakdown:
 
 1. {{name}} - Simple variable substitution
    - Replaces with the struct name (e.g., "User", "Person")
 
 2. {{#properties}} ... {{/properties}} - Section tag (loop)
    - Iterates through each property in the properties array
    - Everything between these tags is repeated for each property
 
 3. {{variable}} - Property name
    - Replaces with the property variable name (e.g., "id", "name", "email")
 
 4. Complex conditional logic for type generation:
    {{#isArray}}[{{/isArray}} - If isArray is true, add opening bracket [
    {{type}} - The Swift type (e.g., "String", "Int")
    {{#isOptional}}?{{/isOptional}} - If isOptional is true, add ?
    {{#isArray}}]{{/isArray}} - If isArray is true, add closing bracket ]
 
 Example Output:
 struct User: Codable {
     let id: Int
     let name: String?
     let email: [String]
 }
 
 Supported Property Types:
 - Regular: String, Int, Double, Bool, UUID
 - Optional: String?, Int?, etc.
 - Array: [String], [Int], etc.
 - Optional Array: [String]?, [Int]?, etc.
 */
