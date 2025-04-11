//
//  TittleSection.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 10/04/25.
//

import SwiftUI

struct TittleSection: View {
    var tittle:String
    var body: some View {
        
         HStack {
             Text(tittle)
                       .font(.title3)
                       .fontWeight(.semibold)
 
                   
                   Spacer()
               }
               .padding()
               .padding(.top, 8)
    }
}

