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
                
                if let firstImage = product.pictures?.first?.url {
                    AsyncImage(url: URL(string: firstImage)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .cornerRadius(12)
                    } placeholder: {
                        ProgressView()
                            .frame(height: 200)
                    }
                }
              
                
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.name ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    Divider().padding(.vertical, 4)
                    
                    
                    Text("Características")
                        .font(.headline)
                        .padding(.bottom, 4)

                    ForEach(product.attributes ?? []) { attr in
                      
                            HStack {
                                Text(attr.name ?? "")
                                    .fontWeight(.medium)
                                Spacer()
                                Text(attr.valueName ?? "")
                                    .foregroundColor(.gray)
                            }
                            .padding(.vertical, 4)
                            Divider()
                        
                    }
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

