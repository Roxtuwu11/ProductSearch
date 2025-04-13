//
//  ProductCardView.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 07/04/25.
//

import SwiftUI

struct FavoriteProductCardView: View {
    var product: Result
    
    var body: some View {
        VStack {
            Image("sillaProducto")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .cornerRadius(12)

            VStack(spacing: 2) {
                Text(product.name ?? "")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)

              
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .gray.opacity(0.2), radius: 6, x: 0, y: 2)

    }
}

