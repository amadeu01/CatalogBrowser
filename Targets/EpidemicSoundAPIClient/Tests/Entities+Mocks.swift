import Foundation
import EpidemicSoundAPIClient
import Mocker
import SharedModel

protocol Mockable {
    static var mock: Self { get }
}

extension Catalog: Mockable {
    static var mock: Self {
        .init(
            genres: [.mock],
            moods: [.mock]
        )
    }
}

extension Genre: Mockable {
    static var mock: Self {
        .init(
            id: "1",
            name: "Funk",
            slug: "Bailão",
            children: nil
        )
    }
}

extension Mood: Mockable {
    static var mock: Self {
        .init(
            id: "22",
            name: "happy",
            slug: "super-happy")
    }
}

extension Featured: Mockable {
    static var mock: Self {
        [[.mock]]
    }
}

extension FeaturedElement: Mockable {
    static var mock: Self {
        .init(
            type: .genre,
            id: "1346",
            title: "Beats",
            image: "https://images.ctfassets.net/ojtnytzl1djm/4Mm4kJ9nwasLwZpQ54472a/90f35901413025d5a627fa132f6c2b56/Beats.jpg"
        )
    }
}

extension SearchResult: Mockable {
    static var mock: Self {
        .init(
            tracks: [.mock],
            page: 1,
            totalPages: 10,
            totalHits: 10,
            total: 10
        )
    }
}

extension Track: Mockable {
    static var mock: Self {
        .init(
            id: 1,
            title: "Music",
            artists: [],
            length: 1,
            stemFull: .init(
                stemType: "",
                s3TrackID: 1,
                lqMp3URL: "",
                waveformURL: ""
            ),
            bpm: 21,
            hasVocals: true,
            energyLevel: "",
            genres: [],
            moods: [],
            publicSlug: "",
            coverArt: .init(
                baseURL: "",
                sizes: .init(xs: "", s: "", m: "", l: "")
            )
        )
    }
}
