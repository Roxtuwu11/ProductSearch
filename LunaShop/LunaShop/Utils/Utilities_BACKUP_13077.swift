//
//  Utilities.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 06/04/25.
//

import Foundation
import SwiftUICore
import UIKit


struct Constants {
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
    static let products: [Product] = [
        Product(name: "Alfombra", description: "Alfombra de leche de cereza", price: "800", imageName: "AlfombraProducto"),  Product(name: "Espejo", description: "Espejo rosa", price: "1200", imageName: "EspejoProducto" ),   Product(name: "Funda rosita fresita", description: "Funda para iphone", price: "1500", imageName: "FundaCelularProducto" ),   Product(name: "Silla", description: "Silla rosa", price: "100,000", imageName: "sillaProducto" )
    ]
  
}
extension Color {
    static let lunaPinkColor = Color("lunaPink")
<<<<<<< HEAD
    
=======
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
>>>>>>> feature/HomeScreen
}
