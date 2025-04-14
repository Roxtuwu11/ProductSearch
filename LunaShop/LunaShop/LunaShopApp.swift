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
    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environment(productStore)
        }
    }
}
