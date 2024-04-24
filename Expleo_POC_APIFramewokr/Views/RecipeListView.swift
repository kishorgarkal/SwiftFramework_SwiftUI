//
//  RecipeListView.swift
//  Expleo_POC_APIFramewokr
//
//  Created by kishor garkal on 25/04/24.
//

import Foundation
import SwiftUI

struct RecipeListView: View {
    @ObservedObject var viewModel: RecipeListViewModel
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading{
                    ActivityIndicator(style: .large, color: .gray)
                } else {
                    List(viewModel.recipes) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            RecipeRow(recipe: recipe)
                        }
                    }
                    .navigationBarTitle("Recipes")
                    .alert(isPresented: $viewModel.showError) {
                        Alert(title: Text("Error"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
                    }
                }
            }
            .onAppear {
                fetchRecipes()
            }
        }
    }

    private func fetchRecipes() {
        viewModel.isLoading = true
        guard Reachability.shared.isConnected else {
            // If not connected to the internet, show an alert
            viewModel.errorMessage = "No internet connection"
            viewModel.showError = true
            viewModel.isLoading = false
            return
        }
        
        // Fetch recipes
        viewModel.fetchRecipes {
            viewModel.isLoading = false
        }
    }
}

