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
    @State var productToSearch = ""
    var body: some View {
        VStack() {
            ZStack {
                Header()
                
                SearchBarView(text: $productToSearch).padding(.top, 160)
                .shadow(color: Color.black.opacity(0.1) ,radius: 8, x:0, y: 4)
            }
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea(.all)
   
                VStack(alignment: .leading) {
                    ScrollView {
                        
               
                      
                 
                        if productStore.isSearching {
                        
                               List(productStore.suggestions, id: \.self) { suggestion in
                                   Button {
                                   
                                   } label: {
                                       Text(suggestion)
                                   }
                               }
                               .listStyle(PlainListStyle())
                               .frame(height: 200)
                            
                           }

                           if productStore.isSearching {
                               ProgressView("Buscando productos...")
                           } else if !productStore.products.isEmpty {
                               List(productStore.products) { product in
                                  
                               }
                           } else {
                               TittleSection(tittle: "Tus favoritos")
                               FavoriteSectionView()
                            
                               TittleSection(tittle: "Te podria gustar")
                               ProductSectionView()
                           }
                          
                        
                      
                    }
                }
                .onChange(of: self.productToSearch) {
                    if productToSearch == "" {
                        self.productStore.isSearching = false
                    }
                    productStore.showSuggestion(for: productToSearch)
                }

            }

    
        }.ignoresSafeArea()
         
           
          
            
            
           
    }
      

    
}
