//
//  HomeDummyData.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 11/14/25.
//


//struct HomeDummyData {
//    static let categories: [SegmentTab: [CategoryItem]] = [
//        .delivery: [
//            .init(title: "한그릇"),
//            .init(title: "치킨"),
//            .init(title: "카페·디저트"),
//            .init(title: "패스트푸드"),
//            .init(title: "한그릇"),
//            .init(title: "치킨"),
//            .init(title: "카페·디저트"),
//            .init(title: "패스트푸드"),
//            .init(title: "한그릇")
//        ],
//        .pickup: [
//            .init(title: "카페"),
//            .init(title: "베이커리"),
//            .init(title: "카페"),
//            .init(title: "베이커리"),
//            .init(title: "카페"),
//            .init(title: "베이커리"),
//            .init(title: "카페"),
//            .init(title: "베이커리"),
//            .init(title: "카페"),
//            .init(title: "베이커리"),
//        ],
//    ]
//    
//    static let brands: [BrandItem] = [
//        .init(title: "B마트"),
//        .init(title: "CU"),
//        .init(title: "이마트슈퍼"),
//        .init(title: "롯데마트"),
//        .init(title: "홈플러스"),
//        .init(title: "GS25"),
//        .init(title: "이마트24"),
//        .init(title: "홈플러스익스프레스")
//    ]
//}

import UIKit

struct CategoryItem {
    let title: String
    let icon: UIImage?
}

struct BrandItem {
    let title: String
    let icon: UIImage?
}

enum HomeDummyData {
    static let categories: [SegmentTab: [CategoryItem]] = [
        .delivery: [
            .init(title: "한그릇", icon: nil),
            .init(title: "치킨", icon: nil),
            .init(title: "카페·디저트", icon: nil),
            .init(title: "피자", icon: nil),
            .init(title: "분식", icon: nil),
            .init(title: "고기", icon: nil),
            .init(title: "찜·탕", icon: nil),
            .init(title: "야식", icon: nil),
            .init(title: "패스트푸드", icon: nil),
            .init(title: "족발·보쌈", icon: nil)
        ],
        .pickup: [
            .init(title: "카페", icon: nil),
            .init(title: "베이커리", icon: nil),
            .init(title: "디저트", icon: nil)
        ],
        .mart: [
            .init(title: "과일", icon: nil),
            .init(title: "정육", icon: nil),
            .init(title: "채소", icon: nil)
        ],
        .gift: [
            .init(title: "케이크", icon: nil),
            .init(title: "꽃", icon: nil)
        ],
        .benefit: [
            .init(title: "이벤트", icon: nil),
            .init(title: "쿠폰", icon: nil)
        ]
    ]
    
    static let brands: [BrandItem] = [
        .init(title: "B마트", icon: nil),
        .init(title: "CU", icon: nil),
        .init(title: "이마트슈퍼", icon: nil),
        .init(title: "GS25", icon: nil),
        .init(title: "홈플러스", icon: nil)
    ]
}
