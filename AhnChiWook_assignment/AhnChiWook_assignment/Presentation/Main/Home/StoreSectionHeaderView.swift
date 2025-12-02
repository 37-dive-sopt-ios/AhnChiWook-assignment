//
//  StoreSectionHeaderView.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 12/2/25.
//


import UIKit

import SnapKit
import Then

final class StoreSectionHeaderView: UICollectionReusableView {

    static let reuseId = "StoreSectionHeaderView"

    private let titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textColor = .baeminBlack
    }

    private let moreButton = UIButton(type: .system).then {
        $0.setTitle("전체보기 >", for: .normal)
        $0.setTitleColor(.baeminGray700, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }

    var onTapMore: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews(titleLabel, moreButton)

        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }

        moreButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }

        moreButton.addTarget(self, action: #selector(didTapMore), for: .touchUpInside)
    }

    @objc private func didTapMore() {
        onTapMore?()
    }

    required init?(coder: NSCoder) { fatalError() }

    func configure(title: String) {
        titleLabel.text = title
    }
}
