//
//  HomeScreen.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 06/04/25.
//

import SwiftUI


#Preview {
    HomeScreen()
}
import SwiftUI

struct HomeScreen: View {
    var body: some View {
        VStack() {
            ZStack {
                
                    Header()
                    
                SearchBarView().padding(.top, 160)
                    .shadow(color: Color.black.opacity(0.1) ,radius: 8, x:0, y: 4)

            }
          
          
            Spacer()
    
        }.ignoresSafeArea()
      
    }
}
