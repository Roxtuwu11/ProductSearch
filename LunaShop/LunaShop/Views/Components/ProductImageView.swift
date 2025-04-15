//
//  ProductImageView.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 14/04/25.
//

import SwiftUI

struct ProductImageView: View {
    var firstImage: String
    var body: some View {
        AsyncImage(url: URL(string: firstImage)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .frame(height: Constants.height/2)
                .cornerRadius(12)
        } placeholder: {
            ProgressView()
                .frame(height: 200)
        }
    }
}


