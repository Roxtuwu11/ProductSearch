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
                Color.white
                    .edgesIgnoringSafeArea(.all)
   
                VStack(alignment: .leading) {
                    ScrollView {
 
                            SuggestionView()
                         
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
         
           
          
            
            
           
    }
      

    
}
