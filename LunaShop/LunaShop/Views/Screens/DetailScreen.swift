//
//  DetailScreen.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 11/04/25.
//

import SwiftUI

struct DetailScreen: View {
    @Environment(ProductStore.self)  var productStore
    @Environment(Router.self)  var router
    var product: Result
    var body: some View {
        @Bindable var productStore = productStore
        ScrollView {
        
            VStack(alignment: .leading, spacing: 16) {
                
                if let firstImage = product.pictures?.first?.url {
                    ProductImageView(firstImage: firstImage)
                }
              
                
                
                VStack(alignment: .leading, spacing: 8) {
                    DetailProductView(product: product)
                }
                .padding(.horizontal)
                
                Spacer()
                 
               }
               .padding(.vertical)
            
           }
           .background(Color(.systemGroupedBackground))
           .edgesIgnoringSafeArea(.bottom)
           .alert("Error", isPresented: $productStore.showErrorAlert) {
               Button("Reintentar", action: {
                   productStore.showErrorAlert = false
                   router.popToRoot()
               })
           } message: {
               Text(productStore.messageError)
           }
       }
  
    
}

