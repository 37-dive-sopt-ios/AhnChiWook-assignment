//
//  HomeDummyData.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 11/14/25.
//

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
            .init(title: "한그릇", icon: .KY),
            .init(title: "치킨", icon: .KY),
            .init(title: "카페·디저트", icon: .KY),
            .init(title: "피자", icon: .KY),
            .init(title: "분식", icon: .KY),
            .init(title: "고기", icon: .KY),
            .init(title: "찜·탕", icon: .KY),
            .init(title: "야식", icon: .KY),
            .init(title: "패스트푸드", icon: .KY),
            .init(title: "족발·보쌈", icon: .KY)
        ],
        .pickup: [
            .init(title: "카페", icon: .JK),
            .init(title: "베이커리", icon: .JK),
            .init(title: "디저트", icon: .JK),
            .init(title: "카페", icon: .JK),
            .init(title: "베이커리", icon: .JK),
            .init(title: "디저트", icon: .JK),
            .init(title: "카페", icon: .JK),
            .init(title: "베이커리", icon: .JK),
            .init(title: "디저트", icon: .JK),
            .init(title: "냠냠치치", icon: .JK)
        ],
        .mart: [
            .init(title: "과일", icon: .KY),
            .init(title: "정육", icon: .KY),
            .init(title: "채소", icon: .KY),
            .init(title: "과일", icon: .KY),
            .init(title: "정육", icon: .KY),
            .init(title: "채소", icon: .KY),
            .init(title: "과일", icon: .KY),
            .init(title: "정육", icon: .KY),
            .init(title: "채소", icon: .KY),
            .init(title: "과일", icon: .KY)
        ],
        .gift: [
            .init(title: "케이크", icon: .KY),
            .init(title: "꽃", icon: .KY),
            .init(title: "케이크", icon: .KY),
            .init(title: "꽃", icon: .KY),
            .init(title: "케이크", icon: .KY),
            .init(title: "꽃", icon: .KY),
            .init(title: "케이크", icon: .KY),
            .init(title: "꽃", icon: .KY),
            .init(title: "케이크", icon: .KY),
            .init(title: "꽃", icon: .KY)
        ],
        .benefit: [
            .init(title: "냠냠", icon: .eye),
            .init(title: "냠냠", icon: .bellIcon),
            .init(title: "냠냠", icon: .moreButton),
            .init(title: "냠냠", icon: .clear),
            .init(title: "냠냠치치", icon: .baeminMoneyIcon),
            .init(title: "냠냠", icon: .infoIcon),
            .init(title: "냠냠", icon: .baeminClubIcon),
            .init(title: "냠냠", icon: .discountIcon),
            .init(title: "냠냠", icon: .btnBack),
            .init(title: "냠냠", icon: .cartIcon)
        ]
    ]
    
    static let brands: [BrandItem] = [
        .init(title: "B마트", icon: .JK),
        .init(title: "CU", icon: .JK),
        .init(title: "이마트슈퍼", icon: .JK),
        .init(title: "GS25", icon: .JK),
        .init(title: "홈플러스", icon: .JK),
        .init(title: "B마트", icon: .JK),
        .init(title: "CU", icon: .JK),
        .init(title: "이마트슈퍼", icon: .JK),
        .init(title: "GS25", icon: .JK),
        .init(title: "홈플러스", icon: .JK)
    ]
    
    static let rankingStores: [StorePreviewItem] = [
        .init(title: "백억보쌈 신림점", rating: 5.0, reviewCount: 1973, discountRate: 25, price: "12,000원"),
        .init(title: "피자 + 사이드", rating: 5.0, reviewCount: 1973, discountRate: 20, price: "12,000원"),
        .init(title: "치자피즈 스토어", rating: 3.25, reviewCount: 1323, discountRate: 15, price: "13,000원")
    ]
    
    static let recentOrderStores: [StorePreviewItem] = [
        .init(title: "ASAP PIZZA", rating: 5.0, reviewCount: 504, discountRate: nil, price: "12,000원"),
        .init(title: "레전드 고기한상", rating: 4.9, reviewCount: 950, discountRate: nil, price: "13,000원"),
        .init(title: "치자피즈 스토어", rating: 3.25, reviewCount: 1323, discountRate: nil, price: "13,000원")
    ]
    
    static let discountStores: [StorePreviewItem] = [
        .init(title: "제육고집 신림점", rating: 5.0, reviewCount: 2800, discountRate: nil, price: "11,000원"),
        .init(title: "파스타예요 영등포점", rating: 5.0, reviewCount: 2851, discountRate: nil, price: "10,000원"),
        .init(title: "치자피즈 스토어", rating: 3.25, reviewCount: 1323, discountRate: nil, price: "13,000원")
    ]
}
