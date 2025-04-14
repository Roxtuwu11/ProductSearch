//
//  FavoriteSectionView.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 10/04/25.
//

import SwiftUI

struct FavoriteSectionView: View {
    @Environment(ProductStore.self)  var productStore
    @Environment(Router.self)  var router
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(productStore.favoriteProducts){ product in
                    FavoriteProductCardView(product: product, isLoading: productStore.isLoading, onTap: {
                        router.navigateTo(route: .detail(id: product.id ?? ""))
                    })
                        .frame(width: Constants.width/2, height: Constants.height/4)
                }
            }
            .padding(.trailing)
        }
        .onAppear
        {
            self.productStore.loadFavoriteProducts()
        }
    }
}


