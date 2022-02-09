import Foundation
import XCTest
import EpidemicSoundAPIClient
import Mocker
import Difference
import SharedModel

final class EpidemicSoundAPIClientTests: XCTestCase {
    var client: APIClient!

    override func setUp() {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockingURLProtocol.self]
        self.client = .makeProd(configuration: configuration)
    }

    func test_FeatureResource() async throws {
        self.stubFeatureApiCall()

        let resource = EpidemicSoundResources.featured().get

        let featured = try await client.send(resource)

        XCTAssertEqual(Featured.mock, featured)
    }

    private func stubFeatureApiCall() {
        let featureURL = URL(string: "https://agw.epidemicsound.com/featured")!
        
        let mock = Mock(url: featureURL, dataType: .json, statusCode: 200, data: [
            .get : try! JSONEncoder().encode(Featured.mock)
        ])

        mock.register()
    }

    func test_CatalogResource() async throws {
        self.stubCatalogApiCall()

        let resource = EpidemicSoundResources.catalog().get

        let catalog = try await client.send(resource)

        XCTAssertEqual(Catalog.mock, catalog)
    }

    private func stubCatalogApiCall() {
        let catalogURL = URL(string: "https://agw.epidemicsound.com/catalog")!

        let mock = Mock(url: catalogURL, dataType: .json, statusCode: 200, data: [
            .get : try! JSONEncoder().encode(Catalog.mock)
        ])

        mock.register()
    }

    func test_SearchResource_WhenSearchByMood() async throws {
        self.stubSearchApiCall()

        let resource = EpidemicSoundResources.searchTracks(forMood: "Euphoric").post

        let searchResult = try await client.send(resource)

        XCTAssertEqual(SearchResult.mock, searchResult)
    }

    func test_SearchResource_WhenSearchByGenre() async throws {
        self.stubSearchApiCall()

        let resource = EpidemicSoundResources.searchTracks(forGenre: "Funk").post

        let searchResult = try await client.send(resource)

        XCTAssertEqual(SearchResult.mock, searchResult)
    }

    private func stubSearchApiCall() {
        let catalogURL = URL(string: "https://agw.epidemicsound.com/music/search")!

        let mock = Mock(url: catalogURL, dataType: .json, statusCode: 200, data: [
            .post : try! JSONEncoder().encode(SearchResult.mock)
        ])

        mock.register()
    }
}




