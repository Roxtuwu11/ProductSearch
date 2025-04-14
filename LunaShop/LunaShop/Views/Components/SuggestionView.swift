//
//  SuggestionView.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 13/04/25.
//

import SwiftUI

struct SuggestionView: View {
    @State var productToSearch = ""
    @Environment(ProductStore.self)  var productStore
    @Environment(Router.self)  var router
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {
                ForEach(suggestions, id: \.self) { suggestion in
                    Button {
                        router.navigateTo(route: .resultSearch(product: suggestion))
                    } label: {
                        Text(suggestion)
                            .padding(.vertical, 8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Divider()
                }
            }
            .padding(.horizontal)
        }
        
        .searchable(text: $productToSearch)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image("luna_logo_icon")
                    .resizable()
                    .frame(width: 100, height: 60)
            }
        }



    }
    var suggestions: [String] {
        
             return productStore.showSuggestion(for: productToSearch)
         
     }
}

#Preview {
    SuggestionView()
}
