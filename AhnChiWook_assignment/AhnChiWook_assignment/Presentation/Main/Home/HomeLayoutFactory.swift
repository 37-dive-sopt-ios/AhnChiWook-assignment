//
//  HomeLayoutFactory.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 11/14/25.
//

import UIKit

//struct HomeLayoutFactory {
//    
//    static func layout(onCategoryPageChanged: @escaping (Int) -> Void) -> UICollectionViewLayout {
//        
//        let layout = UICollectionViewCompositionalLayout { sectionIndex, env in
//            guard let section = HomeSection(rawValue: sectionIndex) else { return nil }
//            
//            switch section {
//            case .segmentHeader:
//                return makeSegmentHeaderSection()
//            case .category:
//                return makeCategorySection(onPageChanged: onCategoryPageChanged)
//            case .moreButton:
//                return makeMoreButtonSection()
//            case .brand:
//                return makeBrandSection()
//            }
//        }
//        
//        return layout
//    }
//    
//    private static func makeSegmentHeaderSection() -> NSCollectionLayoutSection {
//        // 더미 그룹 (아이템은 안 쓰고 header만 씀)
//        let itemSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1),
//            heightDimension: .absolute(1)
//        )
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        
//        let groupSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1),
//            heightDimension: .absolute(1)
//        )
//        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
//        
//        let section = NSCollectionLayoutSection(group: group)
//        
//        let headerSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1),
//            heightDimension: .absolute(56)
//        )
//        let header = NSCollectionLayoutBoundarySupplementaryItem(
//            layoutSize: headerSize,
//            elementKind: UICollectionView.elementKindSectionHeader,
//            alignment: .top
//        )
//        section.boundarySupplementaryItems = [header]
//        return section
//    }
//    
//    private static func makeCategorySection(onPageChanged: @escaping (Int) -> Void) -> NSCollectionLayoutSection {
//        
//        // 한 페이지(=CategoryPageCell) 크기
//        let itemSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .absolute(160) // 5x2 = 80 * 2
//        )
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        
//        let group = NSCollectionLayoutGroup.horizontal(
//            layoutSize: itemSize,
//            subitems: [item]
//        )
//        
//        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .groupPaging
//        section.contentInsets = .init(top: 8, leading: 0, bottom: 8, trailing: 0)
//        
//        section.visibleItemsInvalidationHandler = { _, offset, env in
//            let pageWidth = env.container.contentSize.width
//            guard pageWidth > 0 else { return }
//            let page = Int(round(offset.x / pageWidth))
//            onPageChanged(page)
//        }
//        
//        return section
//    }
//    
//    private static func makeMoreButtonSection() -> NSCollectionLayoutSection {
//        let itemSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .absolute(44)
//        )
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        
//        let group = NSCollectionLayoutGroup.vertical(
//            layoutSize: itemSize,
//            subitems: [item]
//        )
//        
//        let section = NSCollectionLayoutSection(group: group)
//        section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
//        return section
//    }
//    
//    private static func makeBrandSection() -> NSCollectionLayoutSection {
//        let itemSize = NSCollectionLayoutSize(
//            widthDimension: .absolute(70),
//            heightDimension: .absolute(90)
//        )
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        
//        let groupSize = NSCollectionLayoutSize(
//            widthDimension: .absolute(70),
//            heightDimension: .absolute(90)
//        )
//        
//        let group = NSCollectionLayoutGroup.horizontal(
//            layoutSize: groupSize,
//            subitems: [item]
//        )
//        
//        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .continuous
//        section.interGroupSpacing = 12
//        section.contentInsets = .init(top: 12, leading: 16, bottom: 12, trailing: 16)
//        return section
//    }
//}

struct HomeLayoutFactory {
    
    static func layout(onCategoryPageChanged: @escaping (Int) -> Void) -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, env in
            guard let section = HomeSection(rawValue: sectionIndex) else { return nil }
            
            switch section {
            case .segmentHeader:
                return makeSegmentHeaderSection()
            case .category:
                return makeCategorySection(onPageChanged: onCategoryPageChanged)
            case .moreButton:
                return makeMoreButtonSection()
            case .brand:
                return makeBrandSection()
            }
        }
        
        return layout
    }
    
    private static func makeSegmentHeaderSection() -> NSCollectionLayoutSection {
        // 더미 그룹 (아이템은 안 쓰고 header만 씀)
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(1)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(56)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    private static func makeCategorySection(onPageChanged: @escaping (Int) -> Void) -> NSCollectionLayoutSection {
        
        // 한 페이지(=CategoryPageCell) 크기
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(160) // 5x2 = 80 * 2
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: itemSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = .init(top: 8, leading: 0, bottom: 8, trailing: 0)
        
        section.visibleItemsInvalidationHandler = { _, offset, env in
            let pageWidth = env.container.contentSize.width
            guard pageWidth > 0 else { return }
            let page = Int(round(offset.x / pageWidth))
            onPageChanged(page)
        }
        
        return section
    }
    
    private static func makeMoreButtonSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(44)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: itemSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        return section
    }
    
    private static func makeBrandSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(70),
            heightDimension: .absolute(90)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(70),
            heightDimension: .absolute(90)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 12
        section.contentInsets = .init(top: 12, leading: 16, bottom: 12, trailing: 16)
        return section
    }
}

enum HomeSection: Int, CaseIterable {
    case segmentHeader
    case category
    case moreButton
    case brand
}
