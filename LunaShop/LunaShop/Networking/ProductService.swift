//
//  ProductService.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 12/04/25.
//

import Foundation
struct ProductService {
    func fetchProducts(request: RequestProduct) async throws -> [ResponseProduct] {
        let request = APIRequest(
            path: "/search?",
            method: .GET,
            queryItems: try request.toQueryItems()
        )

        return try await APIClient.shared.send(request)
    }
}
extension Encodable {
    func toQueryItems() throws -> [URLQueryItem] {
        let data = try JSONEncoder().encode(self)
        let dict = try JSONSerialization.jsonObject(with: data) as? [String: Any] ?? [:]
        
        return dict.map { key, value in
            URLQueryItem(name: key, value: "\(value)")
        }
    }
}

