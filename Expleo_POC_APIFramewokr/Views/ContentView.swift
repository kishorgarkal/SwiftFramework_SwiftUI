//
//  ContentView.swift
//  Expleo_POC_APIFramewokr
//
//  Created by kishor garkal on 25/04/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = RecipeListViewModel() // Initialize the view model
    
    var body: some View {
        RecipeListView(viewModel: viewModel) // Pass the view model to RecipeListView
    }
}

#Preview {
    ContentView()
}
