//
//  Property.swift
//  SwiftGenerator
//
//  Created by Esraa Eid on 28/03/2025.
//

import Foundation

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

// MARK: - Convenience Initializers
extension Property {
    public static func optional(_ variable: String, type: String) -> Property {
        return Property(variable: variable, type: type, isOptional: true)
    }
    
    public static func array(_ variable: String, type: String) -> Property {
        return Property(variable: variable, type: type, isArray: true)
    }
    
    public static func optionalArray(_ variable: String, type: String) -> Property {
        return Property(variable: variable, type: type, isOptional: true, isArray: true)
    }
} 