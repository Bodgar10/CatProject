//
//  CatProjectApp.swift
//  CatProject
//
//  Created by Bodgar Espinosa Miranda on 16/01/25.
//

import SwiftUI
import NetworkSDK

@main
struct CatProjectApp: App {
    
    let test = NetworkSDKDependencies()
    
    var body: some Scene {
        WindowGroup {
            CatsListView()
        }
    }
}
