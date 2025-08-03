# SwiftGenerator

A powerful Swift code generation tool that demonstrates multiple approaches to generating Swift code programmatically. This project showcases template-based generation using Hummingbird Mustache, programmatic generation using Apple's SwiftSyntax, and OpenAPI integration for API-driven code generation.

## 📖 Medium Article

This project accompanies a comprehensive Medium article that explores different approaches to Swift code generation:

**["Mastering Swift Code Generation: From Templates to Programmatic Generation"](https://medium.com/@yourusername/mastering-swift-code-generation-from-templates-to-programmatic-generation)**

The article covers:
- **Template-based generation** using Hummingbird Mustache
- **Programmatic generation** using Apple's SwiftSyntax
- **OpenAPI integration** for API-driven code generation
- **Best practices** and real-world examples
- **Performance comparisons** between different approaches
- **Advanced techniques** for custom code generation

📚 **Read the full article** to understand the concepts, implementation details, and practical examples that inspired this project.

## 🚀 Features

### Multiple Generation Approaches
- **Template-Based Generation**: Using Hummingbird Mustache templates for flexible code generation
- **Programmatic Generation**: Using Apple's SwiftSyntax for precise control over code structure
- **OpenAPI Integration**: Generate Swift code from OpenAPI specifications
- **File Output**: Automatically writes generated code to organized files

### Type Safety & Models
- **Dedicated Property Models**: Type-safe property definitions with support for optional types and arrays
- **Structured Data**: Clean separation between data models and generation logic
- **Extensible Architecture**: Easy to add new property types and generation methods

### Advanced Capabilities
- **Batch Generation**: Generate multiple files at once
- **Custom Templates**: Support for custom Mustache templates
- **Error Handling**: Robust error handling with user feedback
- **File Organization**: Automatic directory creation and file management

## 📦 Installation

### Prerequisites
- macOS 12.0 or later
- Swift 6.0 or later
- Xcode 14.0 or later (for development)

### Using Swift Package Manager

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/SwiftGenerator.git
cd SwiftGenerator
```

2. **Build the project**
```bash
swift build
```

3. **Run the executable**
```bash
swift run SwiftGeneratorExecutable
```

## 🛠️ Usage

### Basic Usage

```swift
import SwiftGenerator

let generator = SwiftGenerator()

// Generate using Mustache templates
generator.generateWithSwiftMustache()

// Generate using SwiftSyntax
generator.generateWithSwiftSyntax()

// Generate all structs at once
generator.generateAllStructs()
```

## 📁 Project Structure

```
SwiftGenerator/
├── Sources/
│   ├── SwiftGenerator/
│   │   ├── Models/
│   │   │   ├── Property.swift              # Mustache property model
│   │   │   ├── StructData.swift            # Mustache struct data
│   │   │   └── SwiftSyntaxProperty.swift  # SwiftSyntax property model
│   │   ├── HummingbirdMustache/
│   │   │   ├── MustacheTemplateGenerator.swift
│   │   │   └── SturctTemplate.swift
│   │   ├── SwiftSyntax/
│   │   │   └── SwiftSyntaxGenerator.swift
│   │   ├── SwiftGenerator.swift            # Main generator
│   │   ├── openapi.yaml                   # OpenAPI specification
│   │   └── openapi-generator-config.yaml  # OpenAPI config
│   └── SwiftGeneratorExecutable/
│       └── main.swift                     # CLI interface
├── Tests/
│   └── SwiftGeneratorTests/
└── Package.swift
```

## 🙏 Acknowledgments

- [Hummingbird Mustache](https://github.com/hummingbird-project/hummingbird-mustache) for template engine
- [Swift Syntax](https://github.com/apple/swift-syntax) for programmatic code generation
- [Swift OpenAPI Generator](https://github.com/apple/swift-openapi-generator) for API-driven generation

---

**📝 This project is part of a Medium article series on Swift development. Check out the full article for detailed explanations and advanced techniques!**
