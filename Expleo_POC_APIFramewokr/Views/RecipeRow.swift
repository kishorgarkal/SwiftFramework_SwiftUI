//
//  RecipeRow.swift
//  Expleo_POC_APIFramewokr
//
//  Created by kishor garkal on 25/04/24.
//

import Foundation
import SwiftUI
import SampleAPIFramework

struct RecipeRow: View {
    let recipe: Recipe
    private let networkService = NetworkService()

    @State private var image: UIImage? = nil
    
    var body: some View {
        HStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)
                    .onAppear {
                        loadImage()
                    }
            }
            VStack(alignment: .leading) {
                Text(recipe.name ?? "Unknown")
                    .font(.headline)
                Text(recipe.cuisine ?? "Cuisine: Unknown")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 8)
    }
    
    private func loadImage() {
        guard let imageUrl = recipe.image else { return }
        networkService.loadImage(from: imageUrl) { loadedImage in
            self.image = loadedImage
        }
    }
}
