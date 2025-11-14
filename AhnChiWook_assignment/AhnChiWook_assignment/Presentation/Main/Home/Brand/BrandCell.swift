//
//  BrandCell.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 11/14/25.
//

import UIKit

import SnapKit
import Then


final class BrandCell: UICollectionViewCell {
    
    static let reuseId = "BrandCell"
    
    private let icon = UIView().then {
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 16
    }
    private let label = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubviews(icon, label)
        
        icon.snp.makeConstraints {
            $0.top.equalToSuperview().offset(4)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(44)
        }
        
        label.snp.makeConstraints {
            $0.top.equalTo(icon.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func configure(_ brand: BrandItem) {
        label.text = brand.title
    }
}
