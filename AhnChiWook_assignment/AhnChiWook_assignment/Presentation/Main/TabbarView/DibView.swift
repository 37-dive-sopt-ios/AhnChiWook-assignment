//
//  DibView.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 11/14/25.
//

import UIKit

import SnapKit
import Then


final class DibView: BaseViewController {
    
    private let dibView = UIView()
    
    override func setStyle() {
        dibView.do {
            $0.backgroundColor = .systemGreen
        }
    }
    
    override func setUI() {
        view.addSubview(dibView)
    }
    
    override func setLayout() {
        dibView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
