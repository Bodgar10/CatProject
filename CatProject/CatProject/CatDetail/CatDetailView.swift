//
//  CatDetailView.swift
//  CatProject
//
//  Created by Bodgar Espinosa Miranda on 17/01/25.
//

import SwiftUI

struct CatDetailView: View {
    let cat: CatModel
    let image: Image

    var body: some View {
        VStack {
            image
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .padding(.top)
            
            Text(cat.tags)
                .font(.title)
                .padding(.top, 10)
            
            Text("Size: \(cat.size)")
                .font(.subheadline)
                .padding(.top, 5)
            
            Spacer()
        }
        .navigationBarTitle("Cat Details", displayMode: .inline)
    }
}
