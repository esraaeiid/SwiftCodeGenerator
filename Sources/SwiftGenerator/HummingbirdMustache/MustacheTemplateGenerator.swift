//
//  MustacheTemplateGenerator.swift
//  SwiftGenerator
//
//  Created by Esraa Eid on 28/03/2025.
//

import HummingbirdMustache

// MARK: - Mustache Template Generator
// This enum provides functionality to generate Swift structs using Mustache templates.
// It acts as a bridge between the data models and the template rendering system.
public enum Templates {
    static func generateStruct(from data: [String: Any]) -> String {
        do {
            // Create a Mustache template instance from the struct template string
            // This template is defined in SturctTemplate.swift
            let template = try HBMustacheTemplate(string: Templates.structTemplate)
            
            // Render the template with the provided data
            // This replaces all Mustache placeholders with actual values
            return template.render(data)
            
        } catch {
            // Handle template rendering errors gracefully
            // Common errors include malformed template syntax or invalid data structure
            print("Error rendering template: \(error)")
            return ""
        }
    }
}
