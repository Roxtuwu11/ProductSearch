//
//  APIModel.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 12/04/25.
//

import Foundation




struct RequestProduct: Codable {
    let site_id: String
    let status: String
    let product_identifier: String?
    let q: String?
    let limit: Int?
    init(site_id: String, status: String, product_identifier: String?, q: String?, limit: Int?) {
        self.site_id = site_id
        self.status = status
        self.product_identifier = product_identifier
        self.q = q
        self.limit = limit
    }
}
struct ResponseProduct: Codable {
    let keywords: String
    let paging: Paging
    let results: [Result]
}


struct Paging: Codable {
    let total, limit, offset: Int
}


struct Result: Codable, Identifiable {
 
  
    
    let id, status, domain_id: String?
    let settings: Settings?
    let name: String?
    let mainFeatures: [MainFeature]?
    let attributes: [Attribute]?
    let pictures: [Picture]?
    let parentID: String?
    let childrenIDS: [String]?
}


struct MainFeature: Codable {
    let text, type: String?
}
struct Attribute: Codable {
    let id, name, valueID, valueName: String?
}


struct Picture: Codable{
    let id: String?
    let url: String?
}


struct Settings: Codable {
    let listingStrategy: String?
}
