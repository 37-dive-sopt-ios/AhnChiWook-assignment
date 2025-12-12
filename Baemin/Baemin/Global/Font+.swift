//
//  Font+.swift
//  Baemin
//
//  Created by 안치욱 on 12/9/25.
//

import SwiftUI

extension Font {
    static func pretendard(size: CGFloat, weight: Font.Weight) -> Font {
        let familyName = "Pretendard"
        
        var weightString: String
        switch weight {
        case .black:
            weightString = "Black"
        case .bold:
            weightString = "Bold"
        case .heavy:
            weightString = "ExtraBold"
        case .ultraLight:
            weightString = "ExtraLight"
        case .light:
            weightString = "Light"
        case .medium:
            weightString = "Medium"
        case .regular:
            weightString = "Regular"
        case .semibold:
            weightString = "SemiBold"
        case .thin:
            weightString = "Thin"
        default:
            weightString = "Regular"
        }
        
        return .custom("\(familyName)-\(weightString)", size: size)
    }
        
    
    static let head_b_24 = Font.pretendard(size: 24, weight: .bold)
    static let head_b_18 = Font.pretendard(size: 18, weight: .bold)
    static let head_b_16 = Font.pretendard(size: 16, weight: .bold)
    static let head_b_14 = Font.pretendard(size: 14, weight: .bold)
    static let head_b_13 = Font.pretendard(size: 13, weight: .bold)
    
    static let title_sb_18 = Font.pretendard(size: 18, weight: .semibold)
    static let title_sb_14 = Font.pretendard(size: 14, weight: .semibold)
    static let title_sb_10 = Font.pretendard(size: 10, weight: .semibold)
    
    static let body_r_14 = Font.pretendard(size: 14, weight: .regular)
    static let body_r_13 = Font.pretendard(size: 13, weight: .regular)
    static let body_r_12 = Font.pretendard(size: 12, weight: .regular)
    static let body_r_10 = Font.pretendard(size: 10, weight: .regular)
    
    static let caption_r_10 = Font.pretendard(size: 10, weight: .regular)
}
