import Foundation

public struct User: Decodable, Hashable, Identifiable {
    public let id: Int
    public let email: String
    public let first_name: String
    public let last_name: String
    let avatar: String

    public var avatarURL: URL? {
        URL(string: self.avatar)
    }
}
