//
//  ProductCardView.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 07/04/25.
//

import SwiftUI

struct ProductCardView: View {
    var product: Product
    
    var body: some View {
        VStack{
            Image(product.imageName).resizable()
                .frame(width: (Constants.width/3 - 10), height: Constants.height/5 )
                .cornerRadius(20)
            Text(product.name)
                .font(.title3)
                .fontWeight(.bold)
                .scaledToFit()
            Text(product.price)
                .font(.title3)
                .fontWeight(.bold)
            
        }
        .frame(width: Constants.width/3.5)
        .padding()
        .background(Color.maverick)
        .cornerRadius(20)
    }
}

