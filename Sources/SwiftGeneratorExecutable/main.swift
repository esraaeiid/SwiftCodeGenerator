//
//  main.swift
//  SwiftGenerator
//
//  Created by Esraa Eid on 28/03/2025.
//

// MARK: - SwiftGenerator Executable
// This is the command-line interface for the SwiftGenerator tool.
// It demonstrates how to use the SwiftGenerator library to generate Swift code.

import SwiftGenerator

// MARK: - Initialize Generator
// Create an instance of SwiftGenerator to access its code generation capabilities
let generator = SwiftGenerator()

// MARK: - Code Generation Options
// Uncomment the method you want to use for code generation:

// Option 1: Generate using Swift Syntax (programmatic approach)
// This method uses Apple's SwiftSyntax library to build Swift code structures
//generator.generateWithSwiftSyntax()

// Option 2: Generate using Hummingbird Mustache (template-based approach)
// This method uses Mustache templates to generate Swift code
// Currently active - generates User.swift file in Generated/ directory
generator.generateWithSwiftMustache()

