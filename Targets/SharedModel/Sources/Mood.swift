import Foundation

public struct Mood: Codable, Equatable {
    public let id: String
    public let name: String
    public let slug: String

    public init(
        id: String,
        name: String,
        slug: String
    ) {
        self.id = id
        self.name = name
        self.slug = slug
    }
}
