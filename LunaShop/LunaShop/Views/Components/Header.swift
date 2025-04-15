//
//  Header.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 06/04/25.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack(spacing: 12) {
          
            Spacer()
            Image("luna_logo_icon").resizable().frame(width: 100, height: 80)
            Spacer()
                
    
        }
        .padding(.top, 50)
        .padding(.bottom, 50)
        .padding()
        .background(Color.softPink)
            .frame(maxWidth: Constants.width)
            .clipShape(RoundedCorner(radius: 50, corners: [.bottomLeft, .bottomRight]))
           
       
    
    }
}

#Preview {
    Header()
}
