//
//  File.swift
//  SwiftGenerator
//
//  Created by Esraa Eid on 28/03/2025.
//

import HummingbirdMustache


public enum Templates {
    static func generateStruct(from data: [String: Any]) -> String {
        do {
            let template = try HBMustacheTemplate(string: Templates.structTemplate)
            return template.render(data)
        } catch {
            print("Error rendering template: \(error)")
            return ""
        }
    }
}
