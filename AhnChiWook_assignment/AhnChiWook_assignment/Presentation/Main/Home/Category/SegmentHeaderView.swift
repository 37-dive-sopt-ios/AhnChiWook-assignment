//
//  SegmentHeaderView.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 11/14/25.
//

import UIKit

import SnapKit
import Then


final class SegmentHeaderView: UICollectionReusableView {
    
    static let reuseId = "SegmentHeaderView"
    
    private let scroll = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = false
    }
    
    private let stack = UIStackView().then {
        $0.axis = .horizontal
        //$0.spacing = 20
    }
    
    private let indicator = UIView().then {
        $0.backgroundColor = .black
    }
    
    private var buttons: [UIButton] = []
    private(set) var selectedIndex = 0
    
    var onTabChanged: ((SegmentTab) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func setup() {
        addSubview(scroll)
        scroll.addSubviews(
            stack,
            indicator
        )
        
        
        scroll.snp.makeConstraints { $0.edges.equalToSuperview() }
        stack.snp.makeConstraints { 
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        SegmentTab.allCases.forEach { tab in
            let btn = UIButton(type: .system)
            btn.setTitle(tab.title, for: .normal)
            btn.tag = tab.rawValue
            btn.setTitleColor(.baeminGray300, for: .normal)
            btn.addTarget(self, action: #selector(tap(_:)), for: .touchUpInside)
            
            stack.addArrangedSubview(btn)
            buttons.append(btn)
        }
        
        selectTab(0, animated: false)
    }
    
    @objc private func tap(_ sender: UIButton) {
        selectTab(sender.tag, animated: true)
        onTabChanged?(SegmentTab(rawValue: sender.tag)!)
    }
    
    func selectTab(_ index: Int, animated: Bool) {
        selectedIndex = index
        
        for (i, btn) in buttons.enumerated() {
            btn.setTitleColor(i == index ? .black : .baeminGray300, for: .normal)
            btn.titleLabel?.font = i == index ?
                .boldSystemFont(ofSize: 16) : .systemFont(ofSize: 16)
        }
        
        moveIndicator(animated: animated)
    }
    
    private func moveIndicator(animated: Bool) {
        let btn = buttons[selectedIndex]
        let targetFrame = CGRect(
            x: btn.frame.minX + 15,
            y: bounds.height - 3,
            width: btn.frame.width,
            height: 3
        )
        
        if animated {
            UIView.animate(withDuration: 0.25) {
                self.indicator.frame = targetFrame
            }
        } else {
            indicator.frame = targetFrame
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        moveIndicator(animated: false)
    }
}
