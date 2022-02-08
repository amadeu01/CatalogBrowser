import Foundation

public struct Genre: Codable, Equatable {
    public let id: String
    public let name: String
    public let slug: String

    public let children: [Genre]?

    public init(
        id: String,
        name: String,
        slug: String,
        children: [Genre]?
    ) {
        self.id = id
        self.name = name
        self.slug = slug
        self.children = children
    }
}
