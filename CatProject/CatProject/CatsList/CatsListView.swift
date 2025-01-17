//
//  ContentView.swift
//  CatProject
//
//  Created by Bodgar Espinosa Miranda on 16/01/25.
//

import SwiftUI
import DesignSystem

struct CatsListView: View {
    
    @StateObject private var viewModel = CatsListViewModel()
    @State private var selectedCat: CatModel?
    
    var body: some View {
        NavigationStack {
            List(viewModel.cats) { cat in
                if let image = viewModel.images[cat.id] {
                    Button(action: {
                        selectedCat = cat
                    }) {
                        SmallImageCardView(image: image, title: cat.tags, note: String(cat.size))
                            .padding(.horizontal)
                            .listRowBackground(Color.clear)
                            .listRowInsets(EdgeInsets())
                    }
                    .background(
                        NavigationLink("", destination: CatDetailView(cat: cat, image: image))
                            .opacity(0))
                } else {
                    ProgressView()
                        .frame(width: 50, height: 50)
                }
            }
            .navigationBarTitle("Cats")
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    CatsListView()
}
