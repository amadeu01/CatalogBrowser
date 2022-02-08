import SwiftUI
import CatalogBrowserUI
import EpidemicSoundAPIClient
import SharedModel

@main
struct CatalogBrowserApp: App {
    let api = APIClient.makeProd()

    var body: some Scene {
        WindowGroup {
            FeaturedListView(
                loadFeatureData: { try await api.loadFeatureData() }
            )
        }
    }
}

extension APIClient {
    func loadFeatureData() async throws -> Featured {
        try await self.send(EpidemicSoundResources.featured().get)
    }
}
