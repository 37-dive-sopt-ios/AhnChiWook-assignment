//
//  CategoryItemCell.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 11/14/25.
//

import UIKit

import SnapKit
import Then


final class CategoryItemCell: UICollectionViewCell {
    static let reuseId = "CategoryItemCell"
    
    private let iconView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 16
        $0.clipsToBounds = true
    }
    
    private let label = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textAlignment = .center
        $0.textColor = .baeminBlack
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubviews(iconView, label)
        
        iconView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(4)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(44)
        }
        
        label.snp.makeConstraints {
            $0.top.equalTo(iconView.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func configure(_ item: CategoryItem) {
        iconView.image = item.icon
        label.text = item.title
    }
}
