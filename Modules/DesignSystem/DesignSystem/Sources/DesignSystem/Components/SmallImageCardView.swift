//
//  SwiftUIView.swift
//  DesignSystem
//
//  Created by Bodgar Espinosa Miranda on 16/01/25.
//

import SwiftUI

/// A view that displays a small card with an image, title, and an optional note.
/// The card can perform an action when tapped.
public struct SmallImageCardView: View {
    
    /// The size of the image displayed in the card.
    private let sizeImage: CGFloat = 100
    /// The size of the card.
    private let sizeCard: CGFloat = 130
    /// The image displayed in the card.
    private let image: Image
    /// The main title text displayed in the card.
    private let title: String
    /// An optional note displayed in the card.
    private let note: String
    
    /// Creates a `SmallImageCardView` with the specified content and action.
    ///
    /// - Parameters:
    ///   - image: The image to display in the card.
    ///   - title: The main title text to display.
    ///   - note: An optional note to display. Defaults to an empty string.
    public init(
        image: Image,
        title: String,
        note: String = ""
    ) {
        self.image = image
        self.title = title
        self.note = note
    }
    
    public var body: some View {
        HStack {
            image
                .resizable()
                .frame(width: sizeImage, height: sizeImage)
                .cornerRadius(SizePadding.xxLarge)
                .padding(SizePadding.medium)
            VStack(alignment: .leading, spacing: SizePadding.medium) {
                HStack(spacing: 3) {
                    Text("Size: ")
                        .font(Fonts.H5.attributes.font)
                        .lineSpacing(Fonts.H5.attributes.lineSpacing)
                        .foregroundStyle(Colors.color600)
                    Text(note)
                        .font(Fonts.T2.attributes.font)
                        .lineSpacing(Fonts.T2.attributes.lineSpacing)
                        .foregroundColor(Colors.color400)
                }
                Text(title)
                    .font(Fonts.H2.attributes.font)
                    .lineSpacing(Fonts.H2.attributes.lineSpacing)
                    .foregroundStyle(Colors.color600)
            }
            Spacer()
            VStack {
                Icons.General.arrowForward
                    .frame(width: SizePadding.xxLarge, height: SizePadding.xxLarge)
                    .padding()
                Spacer()
            }
        }
        .frame(height: sizeCard)
        .background(Colors.color200)
        .cornerRadius(SizePadding.xxLarge)
    }
}

#Preview {
    SmallImageCardView(
        image: Icons.Example.example,
        title: "cute, grey, gray, wink",
        note: "64335"
    )
}
