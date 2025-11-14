//
//  OrderView.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 11/14/25.
//

import UIKit

import SnapKit
import Then


final class OrderView: BaseViewController {
    
    private let orderView = UIView()
    
    override func setStyle() {
        orderView.do {
            $0.backgroundColor = .systemPurple
        }
    }
    
    override func setUI() {
        view.addSubview(orderView)
    }
    
    override func setLayout() {
        orderView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
