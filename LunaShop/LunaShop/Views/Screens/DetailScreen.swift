//
//  DetailScreen.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 11/04/25.
//

import SwiftUI

struct DetailScreen: View {

    var product: Result
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
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
                            .scaledToFill()
                            .frame(width: Constants.width/3, height: Constants.width/3)
                            .clipped()
                    default:
                        ProgressView()
                            .frame(width: Constants.width/3, height: Constants.width/3)
                    }
                }
                .frame(height: Constants.height/2)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(16)
                    .shadow(radius: 5)
                
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.name ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                  
                    
                    Text(product.status ?? "")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.horizontal)
                
                Spacer()
                 
               }
               .padding(.vertical)
           }
           .background(Color(.systemGroupedBackground))
           .edgesIgnoringSafeArea(.bottom)
       
       }
  
    
}

