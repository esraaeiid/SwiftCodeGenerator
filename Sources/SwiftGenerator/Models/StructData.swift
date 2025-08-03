//
//  StructData.swift
//  SwiftGenerator
//
//  Created by Esraa Eid on 28/03/2025.
//

import Foundation

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

// MARK: - Convenience Initializers
extension StructData {
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