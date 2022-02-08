import Foundation

public struct Catalog: Codable, Equatable {
    public let genres: [Genre]
    public let moods: [Mood]

    public init(
        genres: [Genre],
        moods: [Mood]
    ) {
        self.genres = genres
        self.moods = moods
    }
}

