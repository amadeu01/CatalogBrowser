//
//  DefaultAPIClientDelegate.swift
//  EpidemicSoundAPIClient
//
//  Created by Amadeu Cavalcante on 07/02/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import Foundation

final class DefaultAPIClientDelegate: APIClientDelegate {
    func client(
        _ client: APIClient,
        willSendRequest request: inout URLRequest
    ) async throws {}

    func shouldClientRetry(
        _ client: APIClient,
        withError error: Error
    ) async throws -> Bool { false }

    func client(
        _ client: APIClient,
        didReceiveInvalidResponse response: HTTPURLResponse,
        data: Data
    ) -> Error {
        APIError.unacceptableStatusCode(response.statusCode)
    }
}
