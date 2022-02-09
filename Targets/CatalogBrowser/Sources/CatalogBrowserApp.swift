import SwiftUI
import CatalogBrowserUI
import EpidemicSoundAPIClient
import SharedModel
import Common

@main
struct CatalogBrowserApp: App {
    let api = APIClient.makeProd()

    var body: some Scene {
        WindowGroup {
            FeaturedListView()
                .environment(\.dynamicTypeSize, .medium)
                .environment(\.colorScheme, .light)
                .environment(\.accessibilityEnabled, false)
                .environment(\.locale, .init(identifier: "en-US"))
                .inject(makeDIContainer())
        }
    }

    func makeDIContainer() -> DIContainer {
        .init(
            interactors: .init(
                loadFeatureData: self.api.loadFeatureData,
                loadTracksDataForMood: self.api.loadTracksForMood(_:),
                loadTracksDataForGenre: self.api.loadTracksForGenre(_:)
            )
        )
    }
}

extension APIClient {
    func loadFeatureData() async throws -> Featured {
        try await self.send(EpidemicSoundResources.featured().get)
    }

    func loadTracksForMood(_ mood: String) async throws -> [Track] {
        try await self.send(EpidemicSoundResources.searchTracks(forMood: mood).post).tracks
    }

    func loadTracksForGenre(_ genre: String) async throws -> [Track] {
        try await self.send(EpidemicSoundResources.searchTracks(forGenre: genre).post).tracks
    }
}
