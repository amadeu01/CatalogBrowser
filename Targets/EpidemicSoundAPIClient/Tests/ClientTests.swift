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
}




