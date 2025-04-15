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
public struct ResponseProduct: Codable {
    public let keywords: String?
    public let paging: Paging?
    public let results: [Result]?
    public init(keywords: String?, paging: Paging?, results: [Result]?) {
        self.keywords = keywords
        self.paging = paging
        self.results = results
    }
}


public struct Paging: Codable {
    public let total, limit, offset: Int
}


public struct Result: Codable, Identifiable, Equatable, Hashable {
   
    public let id, status, domain_id: String?
    public let settings: Settings?
    public let name: String?
    public let mainFeatures: [MainFeature]?
    public let attributes: [Attribute]?
    public let pictures: [Picture]?
    public let parentID: String?
    public let childrenIDS: [String]?
}


public struct MainFeature: Codable, Hashable {
    public let text, type: String?
}
public struct Attribute: Codable, Hashable, Identifiable{
     public let id, name, valueID, valueName: String?
}


public struct Picture: Codable, Hashable{
    public let id: String?
    public let url: String?
}


public struct Settings: Codable, Hashable {
    public let listingStrategy: String?
}


public struct Detail: Codable, Hashable {
    let id, status, name, family_name: String?
    let pickers: [Picker]?
    let pictures: [PictureDetail]?
    let short_description: Description?
}

public struct Description: Codable, Hashable {
    let type, content: String?
}
public struct Picker: Codable, Hashable {
    let picker_id, picker_name: String?
    let products: [Product]
}
public struct Product: Codable, Hashable {
   
    let product_id, picker_label, picture_id : String?
}
public struct PictureDetail: Codable, Hashable {
    let id, url: String?
}
