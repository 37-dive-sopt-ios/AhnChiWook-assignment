//
//  MypageView.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 11/14/25.
//

import UIKit

import SnapKit
import Then


final class MypageView: BaseViewController {
    
    private let myPageView = UIView()
    
    override func setStyle() {
        myPageView.do {
            $0.backgroundColor = .systemPink
        }
    }
    
    override func setUI() {
        view.addSubview(myPageView)
    }
    
    override func setLayout() {
        myPageView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
