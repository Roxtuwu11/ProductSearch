//
//  LunaShopTests.swift
//  LunaShopTests
//
//  Created by Ximena Rotceh Mendoza Gamino on 06/04/25.
//

import XCTest
@testable import LunaShop

final class LunaShopTests: XCTestCase {
    var productStoreTest = ProductStore()
    var userDefaults: UserDefaults!
    var mockService = MockProductService()

    override func setUpWithError() throws {
        userDefaults = UserDefaults(suiteName: "TestSuite")
              userDefaults.removePersistentDomain(forName: "TestSuite")
    }

    override func tearDownWithError() throws {
        userDefaults.removePersistentDomain(forName: "TestSuite")
            userDefaults = nil
        
    }

    func test_fetchProducts_success() {
        let mockService = MockProductService()
        mockService.shouldReturnError = false
        mockService.mockProducts = mockResponseProduct

        let expectation = XCTestExpectation(description: "fetchProducts completes")

        mockService.fetchProducts(request: nil, onSuccess: { response in
            XCTAssertNotNil(response)
            expectation.fulfill()
        }, onFailure: { error in
            XCTFail("Expected success, but got error: \(String(describing: error))")
        })

        wait(for: [expectation], timeout: 1.0)
    }

    func testShowSuggestion_WhenQueryIsEmpty_ReturnsEmptyArray() {
            let result = productStoreTest.showSuggestion(for: "")
            XCTAssertEqual(result, [], "The result is not empty")
            XCTAssertFalse(productStoreTest.isSearching, "isSearching is not false")
        }
 

        func testShowSuggestion_WhenQueryHasMatches_ReturnsFilteredResults() {
            userDefaults.set(["Samsung"], forKey: "searchHistory")
            let result = productStoreTest.showSuggestion(for: "Samsung")
            XCTAssertEqual(result, ["Samsung"])
            XCTAssertTrue(productStoreTest.isSearching)
        }

     

        func testSaveSearchTerm_DoesNotDuplicateTerms() {
            userDefaults.set(["Philips"], forKey: "searchHistory")
            productStoreTest.saveSearchTerm("Philips")
            let history = userDefaults.stringArray(forKey: "searchHistory")
            XCTAssertEqual(history, ["Philips"])
        }

    

       func testLoadProductsFailure() {
           let mockService = MockProductService()
           mockService.shouldReturnError = true

    

           productStoreTest.loadProducts(for: "TV")
           
           XCTAssertFalse(productStoreTest.isLoading)
           XCTAssertTrue(productStoreTest.products.isEmpty)
       }
    func testLoadProducts_WhenGivenSuccessfullResponse_ReturnSuccess(){
     
        
        productStoreTest.loadProducts(for: "Videojuegos")
    }

}
