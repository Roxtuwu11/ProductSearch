//
//  ProductCard.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 06/04/25.
//

import SwiftUI

struct ProductCardView: View {
    var product: Result
    var body: some View {
        HStack(spacing: 16) {
            Image("")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 4) {
                Text(product.name ?? "")
                    .font(.headline)
                    .bold()

            

            }

            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .gray.opacity(0.1), radius: 4, x: 0, y: 1)
   
        
    }
}


