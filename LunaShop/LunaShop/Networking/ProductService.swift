//
//  ProductService.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 12/04/25.
//

import Foundation
protocol ProductServiceProtocol {
    func fetchProducts(
        request: RequestProduct?,
        onSuccess: @escaping (ResponseProduct?) -> Void,
        onFailure: @escaping (Error?) -> Void
    )

    func fetchDetailProduct(
        request: String?,
        onSuccess: @escaping (Detail?) -> Void,
        onFailure: @escaping (Error?) -> Void
    )
}

struct ProductService: ProductServiceProtocol {
 
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
    
    func fetchDetailProduct(request: String? ,onSuccess success:@escaping((_ result: Detail?)-> Void),
            onFailure failure:@escaping((_ error:Error?)->Void)){
        guard let req = request else { return }
        let url = URL(string: URLConstants.urlDetailProduct + req)
        APIClient
            .shared
            .getRequest(url: url!, request: req, responseType: Detail.self, onSuccess:  { (result) in
              success(result)
            }, onFailure: {(error) in
                failure(error)
              })
      }
}

class MockProductService: ProductServiceProtocol {
    var shouldReturnError: Bool = false
    var mockProducts: ResponseProduct?
    var mockDetail: Detail?
    var error: Error?

    func fetchProducts(
        request: RequestProduct?,
        onSuccess: @escaping (ResponseProduct?) -> Void,
        onFailure: @escaping (Error?) -> Void
    ) {
        if shouldReturnError {
            onFailure(error)
        } else {
            onSuccess(mockProducts)
        }
    }

    func fetchDetailProduct(
        request: String?,
        onSuccess: @escaping (Detail?) -> Void,
        onFailure: @escaping (Error?) -> Void
    ) {
        if shouldReturnError {
            onFailure(error)
        } else {
            onSuccess(mockDetail)
        }
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

