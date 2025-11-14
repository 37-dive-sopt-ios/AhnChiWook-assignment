//
//  ShopView.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 11/14/25.
//

import UIKit

import SnapKit
import Then


final class ShopView: BaseViewController {
    
    private let shopView = UIView()
    
    override func setStyle() {
        shopView.do {
            $0.backgroundColor = .systemOrange
        }
    }
    
    override func setUI() {
        view.addSubview(shopView)
    }
    
    override func setLayout() {
        shopView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
