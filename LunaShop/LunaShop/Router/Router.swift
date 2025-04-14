//
//  Router.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 13/04/25.
//

import Foundation
import Observation

@Observable
class Router {
    var routes: [Route] = []
    
    
    func navigateTo(route: Route) {
        routes.append(route)
    }
    func unwind(_ route: Route)
    {
        guard let index = routes.firstIndex(where: { $0 == route }) else { return  }
        routes = Array(routes.prefix(upTo: index + 1))
    }
    func popToRoot()
    {
        routes = []
    }
}

enum Route: Hashable {
    case detail(id: String)
    case resultSearch(product: String)
    
}
