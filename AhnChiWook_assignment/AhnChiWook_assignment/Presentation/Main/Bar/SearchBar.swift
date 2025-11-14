//
//  SearchBar.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 11/14/25.
//

import UIKit

import SnapKit
import Then

final class SearchBar: UIView {
    
    // MARK: - Properties
    
    private let searchIconView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = .searchIcon
    }
    
    private let searchLabel = UILabel().then {
        $0.text = "찾아라! 맛있는 음식과 맛집"
        $0.font = .body_r_14
        $0.textColor = .baeminGray300
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .baeminWhite
        
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.baeminBlack.cgColor
        layer.masksToBounds = true

        setUI()
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(
            searchLabel,
            searchIconView
        )
    }
    
    private func setLayout() {
        searchLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(17)
        }
        
        searchIconView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(17)
            $0.size.equalTo(24)
        }
    }
}
