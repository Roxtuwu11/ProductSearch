//
//  APIModel.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 12/04/25.
//

import Foundation
enum HTTPMethod: String {
    case GET, POST, PUT, DELETE
}

struct APIRequest {
    let path: String
    let method: HTTPMethod
    var queryItems: [URLQueryItem]? = nil
    var headers: [String: String]? = nil
    var body: Encodable? = nil
}

struct RequestProduct: Codable {
    let site_id: String
    let status: String
    let product_identifier: String?
    let q: String?
    let limit: String?
}
struct ResponseProduct: Codable {
    let keywords: String
    let paging: Paging
    let results: [Result]
}


struct Paging: Codable {
    let total, limit, offset: Int
}


struct Result: Codable {
    let id, status, domainID: String
    let settings: Settings
    let name: String
    let mainFeatures: [MainFeature]
    let attributes: [Attribute]
    let pictures: [Picture]
    let parentID: String
    let childrenIDS: [String]
}


struct MainFeature: Codable {
    let text, type: String
}
struct Attribute: Codable {
    let id, name, valueID, valueName: String
}


struct Picture: Codable{
    let id: String
    let url: String
}


struct Settings: Codable {
    let listingStrategy: String
}
