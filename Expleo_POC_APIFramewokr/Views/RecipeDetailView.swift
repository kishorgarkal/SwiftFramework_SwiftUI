//
//  RecipeDetailView.swift
//  Expleo_POC_APIFramewokr
//
//  Created by kishor garkal on 25/04/24.
//

import Foundation
import SwiftUI


struct RecipeDetailView: View {
    let recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Recipe Image
                if let imageUrl = recipe.image {
                    AsyncImageView(url: imageUrl)
                        .frame(height: 200)
                        .scaledToFill()
                        .clipped()
                        .cornerRadius(8)
                        .shadow(radius: 4)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .foregroundColor(.gray)
                        .cornerRadius(8)
                        .shadow(radius: 4)
                }
                
                // Recipe Name
                Text(recipe.name ?? "Unknown Recipe")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                // Cuisine
                Text("Cuisine: \(recipe.cuisine ?? "Unknown")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                // Ingredients
                Text("Ingredients:")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                
                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                        .padding(.leading, 10)
                }
                
                // Instructions
                Text("Instructions:")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                
                ForEach(recipe.instructions, id: \.self) { instruction in
                    Text(instruction)
                        .padding(.leading, 10)
                }
            }
            .padding()
        }
        .navigationBarTitle(recipe.name ?? "Recipe Detail")
    }
}



struct AsyncImageView: View {
    let url: URL
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                    .cornerRadius(8)
                    .shadow(radius: 4)
            case .failure(_):
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .foregroundColor(.gray)
                    .cornerRadius(8)
                    .shadow(radius: 4)
            case .empty:
                ProgressView()
            @unknown default:
                EmptyView()
            }
        }
    }
}

