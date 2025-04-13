//
//  ProductStore.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 12/04/25.
//

import Foundation
import Observation
@Observable
class ProductStore {
    var isLoading = true
    var products: [Result] = []
    var favoriteProducts: [Result] = []
    var errorMessage: String?
    private let service = ProductService()
    
    func loadProducts(for product: String?)  {
        isLoading = true
        let request =  RequestProduct(site_id: "MLA", status: "active", product_identifier: "", q: product, limit: 10)
       
     
     
        service.fetchProducts(request: request, onSuccess: { result in
            guard let product = result else { return  }
            self.products = product.results
            self.isLoading = false
            }, onFailure: { error in
                print("Hubo un error en la peticion")
                self.isLoading = false
            })
        
        
      
    }
    
    func loadFavoriteProducts()  {
        isLoading = true
        let request =  RequestProduct(site_id: "MLA", status: "active", product_identifier: "", q: "Videojuegos", limit: 10)
       
     
     
        service.fetchProducts(request: request, onSuccess: { result in
            guard let product = result else { return  }
            self.favoriteProducts = product.results
            self.isLoading = false
            }, onFailure: { error in
                print("Hubo un error en la peticion")
                self.isLoading = false
            })
        
        
      
    }
    
}
