//
//  HomeScreen.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 06/04/25.
//

import SwiftUI


#Preview {
    HomeScreen(products: Constants.products)
}
import SwiftUI

struct HomeScreen: View {
     var products: [Product]?
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
                    Text("Los favortitos")
                        .font(.title2)
                        .bold()
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(products!){ product in
                                ProductCardView(product: product)
                            }
                        }
                        .padding(.trailing)
                    }
                    .padding(.horizontal)
                }

            }

    
        }.ignoresSafeArea()
          
            
            
           
    }
      

    
}
