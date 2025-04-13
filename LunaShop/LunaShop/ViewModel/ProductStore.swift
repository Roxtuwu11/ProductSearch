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
    var isLoading = false
    var products: [Result] = []
    var errorMessage: String?
    private let service = ProductService()
    
    func loadProducts(for product: String?)  {
        isLoading = true
        let request =  RequestProduct(site_id: "MLA", status: "active", product_identifier: "", q: product, limit: 10)
       
     
     
        service.fetchProducts(request: request, onSuccess: { result in
            guard let product = result else { return  }
            self.products = product.results
            }, onFailure: { error in
                print("Hubo un error en la peticion")
            })
        
        
        isLoading = false
    }
    
}
