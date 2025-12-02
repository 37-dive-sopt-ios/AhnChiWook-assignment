//
//  StoreSectionCell.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 12/2/25.
//

import UIKit

import SnapKit
import Then

final class StoreSectionCell: UICollectionViewCell {

    static let reuseId = "StoreSectionCell"

    private let thumbnail = UIView().then {
        $0.backgroundColor = .baeminGray200
        $0.layer.cornerRadius = 12
    }

    private let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.numberOfLines = 2
    }

    private let ratingLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .baeminGray700
    }

    private let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13, weight: .bold)
        $0.textColor = .baeminBlack
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubviews(thumbnail, titleLabel, ratingLabel, priceLabel)

        thumbnail.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(120)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(thumbnail.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
        }

        ratingLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
        }

        priceLabel.snp.makeConstraints {
            $0.top.equalTo(ratingLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) { fatalError() }

    func configure(_ item: StorePreviewItem) {
        titleLabel.text = item.title
        ratingLabel.text = "\(item.rating)★ (\(item.reviewCount))"
        priceLabel.text = item.discountRate != nil
            ? "\(item.discountRate!)% \(item.price)"
            : item.price
    }
}
