//
//  DetailScreen.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 11/04/25.
//

import SwiftUI

struct DetailScreen: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Image("sillaProducto")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(16)
                    .shadow(radius: 5)
                
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Sillón Acolchado Rosa")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("$5,000 MXN")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.lunaPinkColor)
                    
                    Text("Este elegante sillón rosa acolchonado ofrece la combinación perfecta de comodidad y estilo. Ideal para salas modernas o habitaciones con un toque chic.")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.horizontal)
                
                Spacer()
                   Button(action: {
                       
                   }) {
                       Text("Comprar ahora")
                           .fontWeight(.semibold)
                           .frame(maxWidth: .infinity)
                           .padding()
                           .background(Color.lunaPinkColor)
                           .foregroundColor(.white)
                           .cornerRadius(12)
                           .shadow(color: Color.lunaPinkColor.opacity(0.3), radius: 5, x: 0, y: 3)
                   }
                   .padding(.horizontal)
                   .padding(.top, 8)
               }
               .padding(.vertical)
           }
           .background(Color(.systemGroupedBackground))
           .edgesIgnoringSafeArea(.bottom)
       }
  
    
}

#Preview {
    DetailScreen()
}
