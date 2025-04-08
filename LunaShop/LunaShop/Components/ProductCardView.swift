//
//  ProductCardView.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 07/04/25.
//

import SwiftUI

struct ProductCardView: View {
    var title: String
    var description: String
    var price: String
    var imageName: String
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .padding()
                .background(Color.white)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("$\(price)")
                    .font(.title3)
                    .fontWeight(.bold)
                Text(title)
                    .fontWeight(.semibold)
                Text(description)
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()

            Button(action: {}) {
                Image(systemName: "plus")
                    .padding()
                    .background(Color.softPink)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(30)
    }
}

#Preview {
    ProductCardView(title: "avellana", description: "salmn", price: "100", imageName: "")
}
