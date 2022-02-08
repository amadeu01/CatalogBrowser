//
//  Request.swift
//  EpidemicSoundAPIClient
//
//  Created by Amadeu Cavalcante on 07/02/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import Foundation

public struct Request<Body, Response> {
    public var method: String
    public var path: String
    public var query: [(String, String?)]?
    public var headers: [String: String]?
    var body: Body?

    public init(
        method: String,
        path: String,
        query: [(String, String?)]? = nil,
        headers: [String: String]? = nil,
        body: Body? = nil
    ) {
        self.method = method
        self.path = path
        self.query = query
        self.headers = headers
        self.body = body
    }
}

extension Request {
    public static func get(
        _ path: String,
        query: [(String, String?)]? = nil,
        headers: [String: String]? = nil
    ) -> Request {
        Request(
            method: "GET",
            path: path,
            query: query,
            headers: headers
        )
    }

    public static func post(
        _ path: String,
        query: [(String, String?)]? = nil,
        headers: [String: String]? = nil
    ) -> Request {
        Request(
            method: "POST",
            path: path,
            query: query,
            headers: headers
        )
    }

    public static func post(
        _ path: String,
        query: [(String, String?)]? = nil,
        body: Body?,
        headers: [String: String]? = nil
    ) -> Request where Body: Encodable {
        Request(
            method: "POST",
            path: path,
            query: query,
            headers: headers,
            body: body
        )
    }
}
