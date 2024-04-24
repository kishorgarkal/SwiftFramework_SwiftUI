//
//  RecipeViewModel.swift
//  Expleo_POC_APIFramewokr
//
//  Created by kishor garkal on 25/04/24.
//

import Foundation
import SampleAPIFramework

class RecipeListViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var isLoading: Bool = false
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    
    private let networkService = NetworkService()
    
    func fetchRecipes(completion: @escaping () -> Void) {
        do {
            isLoading = true
            
            guard let url = URL(string: "\(BASE_URL)/recipes") else {
                self.errorMessage = "Invalid URL"
                return
            }
            
            networkService.fetch(url: url) { [weak self] (result: Result<RecipeResponse, Error>) in
                DispatchQueue.main.async {
                    self?.isLoading = false
                    switch result {
                    case .success(let recipeResponse):
                        self?.recipes = recipeResponse.recipes
                        self?.isLoading = false
                        
                    case .failure(let error):
                        self?.showError = true
                        self?.errorMessage = error.localizedDescription
                    }
                }
            }
        }
    }
}
