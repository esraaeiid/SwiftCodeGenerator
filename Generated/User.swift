struct User: Codable {
    let id: Int
    let name: String?
    let emails: [String]
}