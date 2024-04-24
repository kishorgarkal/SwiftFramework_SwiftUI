//
//  RecipeModel.swift
//  Expleo_POC_APIFramewokr
//
//  Created by kishor garkal on 25/04/24.
//

import Foundation

struct RecipeResponse: Decodable {
    let recipes: [Recipe]
}

struct Recipe: Identifiable, Decodable {
    let id: Int?
    let name: String?
    let ingredients: [String]
    let instructions: [String]
    let prepTimeMinutes: Int?
    let cookTimeMinutes: Int?
    let servings: Int?
    let difficulty: String?
    let cuisine: String?
    let caloriesPerServing: Int?
    let tags: [String]
    let userId: Int?
    let image: URL?
    let rating: Double?
    let reviewCount: Int?
    let mealType: [String]
}
