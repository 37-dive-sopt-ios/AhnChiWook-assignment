//
//  Reusable+Dequeuable.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 12/2/25.
//


import UIKit

// MARK: - Reusable Protocol

protocol Reusable: AnyObject {
    static var reuseId: String { get }
}

extension Reusable {
    static var reuseId: String {
        String(describing: Self.self)
    }
}

// 자동 적용
extension UICollectionViewCell: Reusable {}
extension UICollectionReusableView: Reusable {}
extension UITableViewCell: Reusable {}


// MARK: - UICollectionView: register + safe dequeue

extension UICollectionView {

    // Cell 등록 편의 메서드
    func register<Cell: UICollectionViewCell>(_ type: Cell.Type) {
        register(type, forCellWithReuseIdentifier: type.reuseId)
    }

    // Header/Footer 등록 편의 메서드
    func registerHeader<View: UICollectionReusableView>(_ type: View.Type) {
        register(type,
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: type.reuseId)
    }

    // 공통 Cell dequeue
    func dequeue<Cell: UICollectionViewCell>(
        _ type: Cell.Type,
        for indexPath: IndexPath
    ) -> Cell {
        guard let cell = dequeueReusableCell(
            withReuseIdentifier: type.reuseId,
            for: indexPath
        ) as? Cell else {
            fatalError("❌ Failed to dequeue cell: \(type.reuseId)")
        }
        return cell
    }

    // Header dequeue
    func dequeueHeader<View: UICollectionReusableView>(
        _ type: View.Type,
        for indexPath: IndexPath
    ) -> View {
        guard let view = dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: type.reuseId,
            for: indexPath
        ) as? View else {
            fatalError("❌ Failed to dequeue header: \(type.reuseId)")
        }
        return view
    }
}
