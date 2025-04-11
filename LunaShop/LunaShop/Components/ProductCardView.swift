//
//  ProductCard.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 06/04/25.
//

import SwiftUI

struct ProductCardView: View {
    var product: Product
    var body: some View {
        HStack{
            Image(product.imageName).resizable()
                .frame(width: Constants.width / 3,height: Constants.height/6)
                .cornerRadius(20)
                .padding()
            VStack(alignment: .leading, spacing: 30) {
                Text(product.name)
                    .font(.title)
                    .bold()
                Text(product.price)
                    .font(.title2)
                Text(product.description)
                
            }
            Spacer()
        
        }
        .frame(width: Constants.width - 20, height: Constants.height/5)
        .background(Color.maverick)
        .cornerRadius(20)
   
        
    }
}


