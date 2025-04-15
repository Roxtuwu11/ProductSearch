//
//  ProductCardView.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 07/04/25.
//

import SwiftUI
import Shimmer
struct FavoriteProductCardView: View {
    var product: Result
    var isLoading: Bool
    var onTap: () -> Void
    var body: some View {
        Button(action: onTap) {
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
                    .redacted(reason: isLoading ? .placeholder : [])
                         .shimmering(active: isLoading)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                
                
                
            }
            
        }
        .redacted(reason: isLoading ? .placeholder : [])
             .shimmering(active: isLoading)
    }
       

        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .gray.opacity(0.2), radius: 6, x: 0, y: 2)

    }
}

