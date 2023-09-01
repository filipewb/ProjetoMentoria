//
//  CategoryViewModel.swift
//  MentoriaMoa-SDKNetwork
//
//  Created by Eduardo Hoffmann on 01/09/23.
//

import Foundation

class CategoryViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var dataSource = [CategoryModel]()
    
    let provider = CategoryProvider()
    
    init() {
        getCategories()
    }
    
    private func getCategories() {
        isLoading = true
    
        provider.getListCategory(uIdFirebase: "CodandoComMoa") { result in
            switch result {
                
            case .success(let categoriesModel):
                self.dataSource = categoriesModel
                self.isLoading = false
            case .failure(let error):
                debugPrint(error.localizedDescription)
                self.isLoading = false
            }
        }
        
    }
}
