//
//  DetailProductView.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 14/04/25.
//

import SwiftUI

struct DetailProductView: View {
    var product: Result
    var body: some View {
        Text(product.name ?? "")
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(.primary)
        
        Divider().padding(.vertical, 4)
        
        
        Text("Características")
            .font(.headline)
            .padding(.bottom, 4)

        ForEach(product.attributes ?? []) { attr in
          
                HStack {
                    Text(attr.name ?? "")
                        .fontWeight(.medium)
                    Spacer()
                    Text(attr.valueName ?? "")
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 4)
                Divider()
            
        }
    }
}


