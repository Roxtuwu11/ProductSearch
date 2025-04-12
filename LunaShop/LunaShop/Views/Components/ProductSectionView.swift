//
//  ProductSectionView.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 10/04/25.
//

import SwiftUI

struct ProductSectionView: View {
    var products: [Product]
    var body: some View {
        ForEach(products){ product in
            ProductCardView(product: product)
            
            .frame(maxWidth: .infinity)

               
        }    }
}

