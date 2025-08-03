public struct Person: Codable {
    let id: UUID
    let firstName: String?
    let lastName: String?
    let phoneNumbers: [String]
    let age: Int
    let email: String?
}