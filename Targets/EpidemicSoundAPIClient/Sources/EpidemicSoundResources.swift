import Foundation
import SharedModel

public enum EpidemicSoundResources {}

// MARK: - Featured

extension EpidemicSoundResources {
    public static func featured() -> FeatureResource {
        FeatureResource(path: "/featured")
    }

    public struct FeatureResource {
        public let path: String

        public var get: Request<Void, Featured> { .get(path) }
    }
}

// MARK: - Catalog

extension EpidemicSoundResources {
    public static func catalog() -> CatalogResource {
        CatalogResource(path: "/catalog")
    }

    public struct CatalogResource {
        public let path: String

        public var get: Request<Void, Catalog> { .get(path) }
    }
}

// MARK: - Search

func blah() {
    let a = 1
    Int(floor(1/10))
}


extension EpidemicSoundResources {
    public static func searchTracks(forMood mood: String) -> SearchMoodTracksResource {
        .init(path: "/music/search", mood: mood)
    }

    public static func searchTracks(forGenre genre: String) -> SearchGenreTracksResource {
        .init(path: "/music/search", genre: genre)
    }

    public struct SearchMoodTracksResource {
        public let path: String
        public let mood: String

        public var post: Request<SearchParams, SearchResult> {
            .post(
                self.path,
                body: SearchParams(moods: [self.mood], genres: [], vocals: [], page: 1)
            )
        }
    }

    public struct SearchGenreTracksResource {
        public let path: String
        public let genre: String

        public var post: Request<SearchParams, SearchResult> {
            .post(
                self.path,
                body: SearchParams(moods: [], genres: [self.genre], vocals: [], page: 1)
            )
        }
    }
}
