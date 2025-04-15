//
//  ProductCard.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 06/04/25.
//

import SwiftUI
import Shimmer
struct ProductCardView: View {
    var product: Result
    var onTap: () -> Void
    var isLoading: Bool
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 16) {
                AsyncImage(url: URL(string: product.pictures?.first?.url ?? "https://http2.mlstatic.com/D_NQ_NP_756769-MLU70604693274_072023-F.jpg")) { phase in
                    switch phase {
                    case .failure:
                        Image(systemName: "photo")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                            .frame(width: Constants.width/3, height: Constants.width/3)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: Constants.width/3, height: Constants.height/4)
                            .clipped()
                            .cornerRadius(10)
                    default:
                        ProgressView()
                            .frame(width: Constants.width/3, height: Constants.width/3)
                    }
                }
               
               
               
             

                VStack(alignment: .leading, spacing: 4) {
                    Text(product.name ?? "")
                        .font(.headline)
                        .bold()
                        .foregroundColor(.primary)
                }

                Spacer()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: .gray.opacity(0.1), radius: 4, x: 0, y: 1)
        }
        .redacted(reason: isLoading ? .placeholder : [])
             .shimmering(active: isLoading)
        .buttonStyle(PlainButtonStyle())
    }
}

