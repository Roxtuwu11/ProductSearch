//
//  ResultSearchScreen.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 14/04/25.
//

import SwiftUI

struct ResultSearchScreen: View {
    @Environment(ProductStore.self)  var productStore
    @Environment(Router.self)  var router
   
    var search: String = ""
    var body: some View {
        @Bindable var productStore = productStore
        VStack {
   
            ScrollView {
                ForEach(productStore.products){ product in
                    ProductCardView(product: product, onTap: {
                        router.navigateTo(route: .detail(product: product))
                    }, isLoading: productStore.isLoading
                    )
                    .frame(maxWidth: .infinity)

                       
                }
            }
        
        }
        .alert("Error", isPresented: $productStore.showErrorAlert) {
            Button("Reintentar", action: {
                productStore.showErrorAlert = false
                router.popToRoot()
            })
        } message: {
            Text(productStore.messageError)
        }

   
        .onAppear {
            productStore.loadProducts(for: search)
        }
    }
}

#Preview {
    ResultSearchScreen()
}
