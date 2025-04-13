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
                
                .scaledToFit()
                .frame(width: Constants.width/3)
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


