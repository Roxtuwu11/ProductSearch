//
//  APIClient.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 11/04/25.
//

import Foundation



class APIClient {
    static let shared = APIClient()
    private init() {}

    func send<T: Decodable>(_ request: APIRequest) async throws -> T {
        var components = URLComponents(string: "https://api.example.com\(request.path)")!
        components.queryItems = request.queryItems

        guard let url = components.url else {
            throw URLError(.badURL)
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue

    
        request.headers?.forEach { key, value in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }

    
        if let body = request.body {
            urlRequest.httpBody = try JSONEncoder().encode(AnyEncodable(body))
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
    struct AnyEncodable: Encodable {
        private let encode: (Encoder) throws -> Void

        init<T: Encodable>(_ wrapped: T) {
            self.encode = wrapped.encode
        }

        func encode(to encoder: Encoder) throws {
            try encode(encoder)
        }
    }

}

