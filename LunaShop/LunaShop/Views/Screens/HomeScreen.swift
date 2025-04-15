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
    @State private var isSearchableActive = false
    var body: some View {
        VStack() {
         
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    ScrollView {
                        if isSearchableActive {
                            SuggestionView()
                        }
                         
                         
                        if !productStore.isSearching {
                            TittleSection(tittle: "Tus favoritos")
                            FavoriteSectionView()
                         
                            TittleSection(tittle: "Te podria gustar")
                            ProductSectionView()
                        }
                    }
                }
             
                
            }

    
        }
        .overlay(
            Group {
                if productStore.showErrorAlert {
                    ErrorView(message: productStore.messageError) {
                        productStore.showErrorAlert = false
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(.systemBackground).opacity(0.9))
                }
            }
        )
        .onAppear
        {
            isSearchableActive =  true
        }
           
          
            
            
           
    }
      

    
}
