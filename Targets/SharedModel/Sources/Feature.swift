

import Foundation

public typealias Featured = [[FeaturedElement]]

public struct FeaturedElement: Codable, Equatable, Hashable {
    public let type: `Type`
    public let id: String
    public let title: String
    public let image: String

    public enum `Type`: String, Codable, Equatable {
        case genre = "genre"
        case mood = "mood"
    }

    public init(
        type: FeaturedElement.`Type`,
        id: String,
        title: String,
        image: String
    ) {
        self.type = type
        self.id = id
        self.title = title
        self.image = image
    }
}
