//
//  SearchBarView.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 07/04/25.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var text: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("¿Qué estas buscando?🌙 ", text: $text)
        }
        
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(20)
        .padding(.horizontal)
    }
}


