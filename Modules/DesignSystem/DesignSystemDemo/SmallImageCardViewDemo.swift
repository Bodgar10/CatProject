//
//  SmallImageCardViewDemo.swift
//  DesignSystemDemo
//
//  Created by Bodgar Espinosa Miranda on 17/01/25.
//

import SwiftUI
import DesignSystem

struct SmallImageCardViewDemo: View {
    var body: some View {
        SmallImageCardView(
            image: Icons.Example.example,
            title: "cute, grey, gray, wink",
            note: "64335",
            action: {
                print("Action")
            }
        )
    }
}

#Preview {
    SmallImageCardViewDemo()
}
