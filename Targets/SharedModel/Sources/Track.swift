import Foundation

public struct Track: Codable, Equatable, Hashable {
    public let id: Int
    public let title: String
    public let artists: [String]
    public let length: Int
    public let stemFull: StemFull
    public let bpm: Int
    public let hasVocals: Bool
    public let energyLevel: String
    public let genres, moods: [String]
    public let publicSlug: String
    public let coverArt: CoverArt

    public init(
        id: Int,
        title: String,
        artists: [String],
        length: Int,
        stemFull: StemFull,
        bpm: Int,
        hasVocals: Bool,
        energyLevel: String,
        genres: [String],
        moods: [String],
        publicSlug: String,
        coverArt: CoverArt
    ) {
        self.id = id
        self.title = title
        self.artists = artists
        self.length = length
        self.stemFull = stemFull
        self.bpm = bpm
        self.hasVocals = hasVocals
        self.energyLevel = energyLevel
        self.genres = genres
        self.moods = moods
        self.publicSlug = publicSlug
        self.coverArt = coverArt
    }
}

// MARK: - CoverArt
public struct CoverArt: Codable, Equatable, Hashable {
    public let baseURL: String
    public let sizes: Sizes

    public init(baseURL: String, sizes: Sizes) {
        self.baseURL = baseURL
        self.sizes = sizes
    }

    enum CodingKeys: String, CodingKey {
        case baseURL = "baseUrl"
        case sizes
    }
}

// MARK: - Sizes
public struct Sizes: Codable, Equatable, Hashable {
    public let xs, s, m, l: String

    public init(xs: String, s: String, m: String, l: String) {
        self.xs = xs
        self.s = s
        self.m = m
        self.l = l
    }

    enum CodingKeys: String, CodingKey {
        case xs = "XS"
        case s = "S"
        case m = "M"
        case l = "L"
    }
}

// MARK: - StemFull
public struct StemFull: Codable, Equatable, Hashable {
    public let stemType: String
    public let s3TrackID: Int
    public let lqMp3URL: String
    public let waveformURL: String

    public init(
        stemType: String,
        s3TrackID: Int,
        lqMp3URL: String,
        waveformURL: String
    ) {
        self.stemType = stemType
        self.s3TrackID = s3TrackID
        self.lqMp3URL = lqMp3URL
        self.waveformURL = waveformURL
    }

    enum CodingKeys: String, CodingKey {
        case stemType
        case s3TrackID = "s3TrackId"
        case lqMp3URL = "lqMp3Url"
        case waveformURL = "waveformUrl"
    }
}
