//
//  SuggestionView.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 13/04/25.
//

import SwiftUI

struct SuggestionView: View {
    var suggestions: [String] = []
    @Environment(Router.self)  var router
    var body: some View {
        List(suggestions, id: \.self) { suggestion in
            Button {
                router.navigateTo(route: .resultSearch(product: suggestion))
            } label: {
                Text(suggestion)
            }
        }
        .listStyle(PlainListStyle())
        .frame(height: 200)
    }
}

#Preview {
    SuggestionView()
}
