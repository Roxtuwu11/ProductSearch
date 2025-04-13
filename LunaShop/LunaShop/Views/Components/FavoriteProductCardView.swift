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
         
            AsyncImage(url: URL(string: product.pictures?.first?.url ?? "https://http2.mlstatic.com/D_NQ_NP_756769-MLU70604693274_072023-F.jpg")) { phase in
                        switch phase {
                        case .failure:
                            Image(systemName: "photo")
                                .font(.largeTitle)
                        case .success(let image):
                            image
                                .resizable()
                        default:
                            ProgressView()
                        }
                    }
            .frame(height: Constants.height/5)
                   
                    .cornerRadius(12)
         
             

            VStack(spacing: 2) {
                Text(product.name ?? "")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(3)

              
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .gray.opacity(0.2), radius: 6, x: 0, y: 2)

    }
}

