//
//  File.swift
//  SwiftGenerator
//
//  Created by Esraa Eid on 28/03/2025.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import Foundation


public enum SwiftSyntaxGenerator {
    static func generateStructSyntax(name: String, properties: [(String, String)]) -> DeclSyntax {
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
                for (propertyName, propertyType) in properties {
                    VariableDeclSyntax(bindingSpecifier: .keyword(.let)) {
                        PatternBindingSyntax(
                            pattern: IdentifierPatternSyntax(identifier: .identifier(propertyName)),
                            typeAnnotation: TypeAnnotationSyntax(
                                type: resolveType(propertyType)
                            )
                        )
                    }
                }
            }
        )
        return DeclSyntax(structDecl)
    }

    private static func resolveType(_ typeString: String) -> TypeSyntax {
        if typeString.hasSuffix("?") {
            let baseType = String(typeString.dropLast())
            return TypeSyntax(OptionalTypeSyntax(wrappedType: TypeSyntax(stringLiteral: baseType)))
        } else if typeString.hasPrefix("[") && typeString.hasSuffix("]") {
            let elementType = String(typeString.dropFirst().dropLast())
            return TypeSyntax(ArrayTypeSyntax(element: TypeSyntax(stringLiteral: elementType)))
        } else {
            return TypeSyntax(stringLiteral: typeString)
        }
    }
}

