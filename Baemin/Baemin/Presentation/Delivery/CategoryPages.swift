//
//  CategoryPages.swift
//  Baemin
//
//  Created by 안치욱 on 12/11/25.
//

import SwiftUI

struct DeliveryCategoryItem: Identifiable {
    let id = UUID()
    let imageName: ImageResource
    let title: String
}

struct CategoryPages: View {
    @Binding var selection: Int
    let itemsBySegment: [[DeliveryCategoryItem]]

    var body: some View {
        TabView(selection: $selection) {
            ForEach(itemsBySegment.indices, id: \.self) { index in
                CategoryGrid(items: itemsBySegment[index])
                    .tag(index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

private struct CategoryGrid: View {
    let items: [DeliveryCategoryItem]

    private let columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 5)

    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(items) { item in
                VStack(spacing: 6) {
                    Image(item.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 58, height: 58)
                        .background(.baeminWhiteBg)
                        .clipShape(RoundedRectangle(cornerRadius: 20))

                    Text(item.title)
                        .font(.body_r_14)
                        .lineLimit(1)
                }
            }
        }
        .padding(.horizontal, 16)
    }
}
