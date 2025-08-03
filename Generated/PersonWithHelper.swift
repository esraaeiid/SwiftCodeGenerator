public struct Person: Codable {
    let id: UUID
    let name: String?
    let emails: [String]
    let age: Int
    let phoneNumber: String?
}