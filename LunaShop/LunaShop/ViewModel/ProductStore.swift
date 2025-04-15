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
    var product: Detail?
    var favoriteProducts: [Result] = []
    var likeProducts: [Result] = []
    var errorMessage: String?
    var productToSearch = ""
    var isSearching = false
    var isSearchingError = false
    var suggestions: [String] = ["Cama para perro", "Zelda breath of the wild", "Bolsa de mano", "Pelota de futbol"]
   var id_product = ""
     var showErrorAlert = false
     var messageError = ""
    private let service = ProductService()
    private var debounceTask: Task<Void, Never>?

     func showSuggestion(for query: String )  -> [String] {
        
             if query == "" {
                 self.isSearching = false
                 return []
         }
         self.isSearching = true
         self.saveSearchTerm(query)
         return self.filteredHistory(query: query)
       
     }

     func saveSearchTerm(_ term: String) {
         var history = UserDefaults.standard.stringArray(forKey: "searchHistory") ?? []
         if !history.contains(term) {
             history.insert(term, at: 0)
             UserDefaults.standard.set(history, forKey: "searchHistory")
         }
     }

     func filteredHistory(query: String) -> [String] {
         let history = UserDefaults.standard.stringArray(forKey: "searchHistory") ?? []
         return history.filter { $0.lowercased().contains(query.lowercased()) }
     }

 
    
    func loadProducts(for product: String?)  {
        isLoading = true
        let request =  RequestProduct(site_id: "MLM", status: "active", product_identifier: "", q: product, limit: 10)
       
     
     
        service.fetchProducts(request: request, onSuccess: { result in
            guard let product = result else { return  }
            self.products = product.results
            self.isLoading = false
            }, onFailure: { error in
                self.presentError(error: error)
            })
        
        
      
    }

    
    func loadFavoriteProducts()  {
        isLoading = true
        let request =  RequestProduct(site_id: "MLM", status: "active", product_identifier: "", q: "Videojuegos", limit: 10)
       
     
     
        service.fetchProducts(request: request, onSuccess: { result in
            guard let product = result else { return  }
            self.favoriteProducts = product.results
            self.isLoading = false
            }, onFailure: { error in
                self.presentError(error: error)
            })
        
        
      
    }
    
    func loadLikeProducts()  {
        isLoading = true
        let request =  RequestProduct(site_id: "MLM", status: "active", product_identifier: "", q: "Labial", limit: 10)
       
     
     
        service.fetchProducts(request: request, onSuccess: { result in
            guard let product = result else { return  }
            self.likeProducts = product.results
            self.isLoading = false
            }, onFailure: { error in
                self.presentError(error: error)
            })
        
        
      
    }
    
    func getDetailProduct(with id: String)
    {
        isLoading = true
        service.fetchDetailProduct(request: id) { result in
            guard let product = result else { return  }
            self.product = product
            self.isLoading = false
        } onFailure: { error in
            self.presentError(error: error)
            
        }

    }
    func presentError(error: Error?) {
        self.isLoading = false
        guard let err = error else { return  }
        self.showErrorAlert = true
        self.messageError =  err.localizedDescription
        
    }
    
    
}
