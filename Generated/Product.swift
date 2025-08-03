public struct Product: Codable {
    let id: UUID
    let name: String
    let description: String?
    let price: Double
    let tags: [String]
    let imageURL: String?
    let inStock: Bool
}