//
//  Product.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 06/04/25.
//

import Foundation


struct Product: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let price: String
    let imageName: String
}
