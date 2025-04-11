//
//  SearchBarView.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 07/04/25.
//

import SwiftUI

struct SearchBarView: View {
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("¿Qué estas buscando?🌙 ", text: .constant(""))
        }
        
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(20)
        .padding(.horizontal)
    }
}


#Preview {
    SearchBarView()
}
