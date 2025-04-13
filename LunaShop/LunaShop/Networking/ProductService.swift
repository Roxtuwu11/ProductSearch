//
//  ProductService.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 12/04/25.
//

import Foundation
struct ProductService {
 
    func fetchProducts(request: RequestProduct? ,onSuccess success:@escaping((_ result: ResponseProduct?)-> Void),
            onFailure failure:@escaping((_ error:Error?)->Void)){
        guard let req = request else { return }
        let url = URL(string: URLConstants.urlProductFinder)
        APIClient
            .shared
            .getRequest(url: url!, request: req, responseType: ResponseProduct.self, onSuccess:  { (result) in
              success(result)
            }, onFailure: {(error) in
                failure(error)
              })
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

