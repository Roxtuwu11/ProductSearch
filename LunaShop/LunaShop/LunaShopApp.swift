//
//  LunaShopApp.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 06/04/25.
//

import SwiftUI

@main
struct LunaShopApp: App {
    @State  var productStore = ProductStore()
    @State  var router = Router()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.routes) {
                HomeScreen()
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .detail(let detail):
                            DetailScreen(product: detail)
                  
                            
                        case .resultSearch(product: let product):
                            ResultSearchScreen(search: product)
                        }
                    }
            }
                .environment(productStore)
                .environment(router)
        }
    }
}
