//
//  ProductSectionView.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 10/04/25.
//

import SwiftUI

struct ProductSectionView: View {
    
    @Environment(ProductStore.self)  var productStore
    var body: some View {
        VStack {
        ForEach(productStore.likeProducts){ product in
            ProductCardView(product: product)
            
            .frame(maxWidth: .infinity)

               
        }
        }
        .onAppear
        {
            self.productStore.loadLikeProducts()
        }
    }
        
}

