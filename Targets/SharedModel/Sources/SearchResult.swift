import Foundation

public struct SearchResult: Codable, Equatable, Hashable {
    public let tracks: [Track]
    public let page, totalPages, totalHits, total: Int

    public init(
        tracks: [Track],
        page: Int,
        totalPages: Int,
        totalHits: Int,
        total: Int
    ) {
        self.tracks = tracks
        self.page = page
        self.totalPages = totalPages
        self.totalHits = totalHits
        self.total = total
    }
}
