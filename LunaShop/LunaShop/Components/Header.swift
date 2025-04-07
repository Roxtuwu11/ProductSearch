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
            Image("luna_logo_icon") 
                .resizable()
                .frame(width: 150, height: 100)
    
        }
       
    
    }
}

#Preview {
    Header()
}
