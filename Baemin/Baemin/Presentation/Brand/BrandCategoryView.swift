//
//  BrandCategoryView.swift
//  Baemin
//
//  Created by 안치욱 on 12/11/25.
//

import SwiftUI

struct BrandCategoryView: View {
    private let items: [DeliveryCategoryItem] = [
        .init(imageName: .b1, title: "덴지"),
        .init(imageName: .b2, title: "포치타"),
        .init(imageName: .b3, title: "레제"),
        .init(imageName: .b4, title: "아키"),
        .init(imageName: .b5, title: "마키마"),
        .init(imageName: .b6, title: "엔젤"),
        .init(imageName: .b1, title: "덴지"),
        .init(imageName: .b2, title: "포치타")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 9) {
                ForEach(items) { item in
                    VStack(spacing: 6) {
                        Image(item.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 54, height: 54)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        Text(item.title)
                            .font(.body_r_14)
                            .foregroundColor(.baeminBlack)
                            .lineLimit(1)
                    }
                    .frame(width: 64)
                }
            }
        }
        .background(.baeminWhite)
        .frame(height: 100)
    }
}
