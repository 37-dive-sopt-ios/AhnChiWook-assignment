//
//  DeliveryView.swift
//  Baemin
//
//  Created by 안치욱 on 12/9/25.
//

import SwiftUI

struct DeliveryView: View {
    @State private var nameSelection: Int = 0
    @Namespace private var indicatorNamespace
    
    private let itemsBySegment: [[DeliveryCategoryItem]] = [
            [
                .init(imageName: .KY, title: "한그릇"),
                .init(imageName: .KY, title: "치킨"),
                .init(imageName: .KY, title: "카페·디저트"),
                .init(imageName: .KY, title: "피자"),
                .init(imageName: .KY, title: "분식"),
                .init(imageName: .KY, title: "고기"),
                .init(imageName: .KY, title: "찜·탕"),
                .init(imageName: .KY, title: "야식"),
                .init(imageName: .KY, title: "패스트푸드"),
                .init(imageName: .KY, title: "픽업")
            ],
            (0..<10).map { i in
                DeliveryCategoryItem(imageName: .JK, title: "픽업\(i+1)")
            },
            (0..<10).map { i in
                DeliveryCategoryItem(imageName: .KY_2, title: "장보기\(i+1)")
            },
            (0..<10).map { i in
                DeliveryCategoryItem(imageName: .JK_2, title: "선물\(i+1)")
            },
            (0..<10).map { i in
                DeliveryCategoryItem(imageName: .KY, title: "혜택\(i+1)")
            }
        ]
    
    let nameSegments = ["음식배달", "픽업", "장보기·쇼핑", "선물하기", "혜택모아보기"]
    
    var composedText: AttributedString {
        var title = AttributedString(nameSegments[nameSelection])
        title.font = .head_b_14
        var tail = AttributedString("에서 더보기")
        tail.font = .body_r_14
        
        return title + tail
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            GradationView()
            VStack {
                NameSegmentBar(segments: nameSegments, selection: $nameSelection, indicatorNamespace: indicatorNamespace)
                
                CategoryPages(selection: $nameSelection, itemsBySegment: itemsBySegment)
                .frame(height: 188)
                
                Divider()
                Button {
                    
                } label: {
                    Text(composedText)
                        .foregroundColor(.baeminBlack)
                    Image(.moreButton)
                }
                .padding(.bottom, 8)
            }
            .background(
                Color.white
                    .clipShape(.rect(topLeadingRadius: 10, topTrailingRadius: 10))
            )
        }
        .frame(height: 360)
    }
}
