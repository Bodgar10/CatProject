//
//  ContentView.swift
//  DesignSystemDemo
//
//  Created by Bodgar Espinosa Miranda on 17/01/25.
//

import SwiftUI
import DesignSystem

struct ContentView: View {

    var body: some View {
        NavigationStack {
            List {
                Text("The DSM (Design System Manager) is a crucial tool for ensuring visual and interaction consistency in a mobile project. Its components are pre-built user interface elements")
                Text("They are crafted for reuse across the application, guaranteeing uniform design and functionality on every screen.")
                    .font(.system(size: 14))
                    .foregroundColor(Color.gray)
                NavigationLink(destination: ComponentListView()) { Text("01 - Components") }
            }
            .navigationBarTitle("DSMDemo")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    // MARK: - Component List View

    struct ComponentListView: View {
        @State var sheetShowing: Bool = false
        @State private var newViewShowing = false

        var body: some View {
            List {
                NavigationLink(destination: SmallImageCardViewDemo()) { Text("01 - Small Image Card View") }
                
            }
            .navigationBarTitle("Components")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
