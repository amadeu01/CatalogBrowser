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
