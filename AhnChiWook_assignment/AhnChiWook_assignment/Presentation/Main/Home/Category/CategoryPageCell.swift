//
//  CategoryPageCell.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 11/14/25.
//

import UIKit

import SnapKit


final class CategoryPageCell: UICollectionViewCell {
    
    static let reuseId = "CategoryPageCell"
    
    private var items: [CategoryItem] = []
    
    private let grid: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(
            width: UIScreen.main.bounds.width / 5,
            height: 80
        )
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(grid)
        grid.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        grid.register(CategoryItemCell.self, forCellWithReuseIdentifier: CategoryItemCell.reuseId)
        grid.dataSource = self
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func configure(_ items: [CategoryItem]) {
        self.items = items
        grid.reloadData()
    }
}

extension CategoryPageCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CategoryItemCell.reuseId,
            for: indexPath
        ) as! CategoryItemCell
        cell.configure(items[indexPath.row])
        return cell
    }
}
