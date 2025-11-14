//
//  SegmentTab.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 11/14/25.
//


enum SegmentTab: Int, CaseIterable {
    case delivery, pickup, mart, gift, benefit
    
    var title: String {
        switch self {
        case .delivery: return "음식배달"
        case .pickup: return "픽업"
        case .mart: return "장보기·쇼핑"
        case .gift: return "선물하기"
        case .benefit: return "혜택모아"
        }
    }
}