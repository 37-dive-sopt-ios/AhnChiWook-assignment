//
//  MoreButtonCell.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 11/14/25.
//

import UIKit

import SnapKit
import Then


final class MoreButtonCell: UICollectionViewCell {
    static let reuseId = "MoreButtonCell"
    
    private let label = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.textAlignment = .center
        $0.textColor = .baeminBlack
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        label.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func configure(_ tab: SegmentTab) {
        label.text = "\(tab.title) 더보기 >"
    }
}
