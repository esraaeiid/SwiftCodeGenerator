//
//  File.swift
//  SwiftGenerator
//
//  Created by Esraa Eid on 28/03/2025.
//

import Foundation

extension Templates {
    static let structTemplate = """
struct {{name}}: Codable {
    {{#properties}}
    let {{variable}}: {{#isArray}}[{{/isArray}}{{type}}{{#isOptional}}?{{/isOptional}}{{#isArray}}]{{/isArray}}
    {{/properties}}
}
"""
}
