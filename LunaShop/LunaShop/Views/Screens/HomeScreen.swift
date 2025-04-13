//
//  HomeScreen.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 06/04/25.
//

import SwiftUI


#Preview {
    HomeScreen()
        .environment(ProductStore())
}


struct HomeScreen: View {

    @Environment(ProductStore.self)  var productStore
    var body: some View {
        VStack() {
            ZStack {
                Header()
                
            SearchBarView().padding(.top, 160)
                .shadow(color: Color.black.opacity(0.1) ,radius: 8, x:0, y: 4)
            }
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea(.all)
   
                VStack(alignment: .leading) {
                    ScrollView {
                   
                        TittleSection(tittle: "Tus favoritos")
                        FavoriteSectionView()
                     
                        TittleSection(tittle: "Te podria gustar")
                        ProductSectionView(products: productStore.products)
                           
                        
                          
                        
                      
                    }
                }
               

            }

    
        }.ignoresSafeArea()
            .onAppear {
         
                   self.productStore.loadProducts(for: "cama para perros")
                    
            }
           
          
            
            
           
    }
      

    
}
