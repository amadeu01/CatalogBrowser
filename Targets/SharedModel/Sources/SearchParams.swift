import Foundation

public struct SearchParams: Codable, Equatable, Hashable {
    public let moods, genres, vocals: [String]
    public let page: Int

    public init(
        moods: [String],
        genres: [String],
        vocals: [String],
        page: Int
    ) {
        self.moods = moods
        self.genres = genres
        self.vocals = vocals
        self.page = page
    }
}
