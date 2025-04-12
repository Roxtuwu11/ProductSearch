//
//  FavoriteSectionView.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 10/04/25.
//

import SwiftUI

struct FavoriteSectionView: View {
    var products: [Product]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(products){ product in
                    FavoriteProductCardView(product: product)
                }
            }
            .padding(.trailing)
        }
      
    }
}


