//
//  HomeNavigationBar.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 11/14/25.
//

import UIKit

import SnapKit
import Then

final class HomeNavigationBar: UIView {
    
    private let locationButton = UIButton().then {
        $0.setTitleColor(.baeminBlack, for: .normal)
        $0.setTitle("우리집 ▼", for: .normal)
        $0.titleLabel?.font = .head_b_18
    }
    
    private let buttonStackView = UIStackView().then {
        $0.distribution = .fillEqually
        $0.axis = .horizontal
    }
    
    private let discountButton = UIButton().then {
        $0.setImage(.discountIcon, for: .normal)
    }
    
    private let bellButton = UIButton().then {
        $0.setImage(.bellIcon, for: .normal)
    }
    
    private let cartButton = UIButton().then {
        $0.setImage(.cartIcon, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .baeminWhiteBg
        

        setUI()
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(
            locationButton,
            buttonStackView
        )
        
        buttonStackView.addArrangedSubview(discountButton)
        buttonStackView.addArrangedSubview(bellButton)
        buttonStackView.addArrangedSubview(cartButton)
    }
    
    private func setLayout() {
        locationButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(24)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalTo(96)
            $0.height.equalTo(24)
        }
    }
}
