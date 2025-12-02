//
//  HomeView.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 11/14/25.
//

import UIKit

import SnapKit
import Then

final class HomeView: BaseViewController {
    
    private var currentPageIndex: Int = 0
    
    // MARK: - UI
    
    private let naviBar = HomeNavigationBar()
    private let searchBar = SearchBar()
    
    private lazy var collectionView: UICollectionView = {
        let layout = HomeLayoutFactory.layout { [weak self] pageIndex in
            self?.handleCategoryPageChanged(pageIndex: pageIndex)
        }
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    // MARK: - Data
    
    private var currentTab: SegmentTab = .delivery
    private let categories = HomeDummyData.categories
    private let brands = HomeDummyData.brands
    
    // 아래 3개는 이미 만들었다고 가정 (HomeDummyData 참고)
    private let rankingStores = HomeDummyData.rankingStores
    private let recentOrderStores = HomeDummyData.recentOrderStores
    private let discountStores = HomeDummyData.discountStores
    
    // MARK: - LifeCycle Hooks
    
    override func setStyle() {
        view.backgroundColor = .baeminWhiteBg
    }
    
    override func setUI() {
        view.addSubviews(
            naviBar,
            searchBar,
            collectionView
        )
    }
    
    override func setLayout() {
        naviBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(24)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(naviBar.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(naviBar)
            $0.height.equalTo(40)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    override func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Cell 등록 (extension 사용)
        collectionView.register(CategoryPageCell.self)
        collectionView.register(BrandCell.self)
        collectionView.register(MoreButtonCell.self)
        collectionView.register(StoreSectionCell.self)    // 3개 섹션용
        
        // Header 등록
        collectionView.registerHeader(SegmentHeaderView.self)
        collectionView.registerHeader(StoreSectionHeaderView.self)
    }
    
    // MARK: - Helpers
    
    /// 가로 페이지 스크롤 → Segment 변경 & 더보기 텍스트 변경
    private func handleCategoryPageChanged(pageIndex: Int) {

        guard pageIndex != currentPageIndex else { return }
        currentPageIndex = pageIndex

        guard let tab = SegmentTab(rawValue: pageIndex) else { return }
        currentTab = tab

        // ⬇️ segment header 갱신 (선택 이동만)
        if let header = collectionView.supplementaryView(
            forElementKind: UICollectionView.elementKindSectionHeader,
            at: IndexPath(item: 0, section: HomeSection.segmentHeader.rawValue)
        ) as? SegmentHeaderView {
            header.selectTab(pageIndex, animated: true)
        }

        // ⬇️ MoreButtonCell 텍스트만 직접 업데이트
        if let moreCell = collectionView.cellForItem(
            at: IndexPath(item: 0, section: HomeSection.moreButton.rawValue)
        ) as? MoreButtonCell {
            moreCell.configure(currentTab)
        }
    }

}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate

extension HomeView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        HomeSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sec = HomeSection(rawValue: section) else { return 0 }
        
        switch sec {
        case .segmentHeader:
            return 0
        case .category:
            return SegmentTab.allCases.count
        case .moreButton:
            return 1
        case .brand:
            return brands.count
        case .storeRanking:
            return rankingStores.count
        case .recentOrder:
            return recentOrderStores.count
        case .discountStore:
            return discountStores.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sec = HomeSection(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }
        
        switch sec {
        case .category:
            let cell: CategoryPageCell = collectionView.dequeue(CategoryPageCell.self, for: indexPath)
            guard let tab = SegmentTab(rawValue: indexPath.item) else {
                return cell
            }
            let items = categories[tab] ?? []
            cell.configure(items)
            return cell
            
        case .moreButton:
            let cell: MoreButtonCell = collectionView.dequeue(MoreButtonCell.self, for: indexPath)
            cell.configure(currentTab)
            return cell
            
        case .brand:
            let cell: BrandCell = collectionView.dequeue(BrandCell.self, for: indexPath)
            cell.configure(brands[indexPath.item])
            return cell
            
        case .storeRanking:
            let cell: StoreSectionCell = collectionView.dequeue(StoreSectionCell.self, for: indexPath)
            cell.configure(rankingStores[indexPath.item])
            return cell
            
        case .recentOrder:
            let cell: StoreSectionCell = collectionView.dequeue(StoreSectionCell.self, for: indexPath)
            cell.configure(recentOrderStores[indexPath.item])
            return cell
            
        case .discountStore:
            let cell: StoreSectionCell = collectionView.dequeue(StoreSectionCell.self, for: indexPath)
            cell.configure(discountStores[indexPath.item])
            return cell
            
        case .segmentHeader:
            fatalError("segmentHeader section has no cells")
        }
    }
    
    // 헤더
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let section = HomeSection(rawValue: indexPath.section) else {
            return UICollectionReusableView()
        }
        
        switch section {
        case .segmentHeader:
            let header: SegmentHeaderView = collectionView.dequeueHeader(
                SegmentHeaderView.self,
                for: indexPath
            )
            
            header.onTabChanged = { [weak self] tab in
                guard let self = self else { return }
                self.currentTab = tab
                
                let indexPath = IndexPath(item: tab.rawValue, section: HomeSection.category.rawValue)
                self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                
                self.collectionView.reloadSections(IndexSet(integer: HomeSection.moreButton.rawValue))
            }
            
            header.selectTab(currentTab.rawValue, animated: false)
            return header
            
        case .storeRanking:
            let header: StoreSectionHeaderView = collectionView.dequeueHeader(StoreSectionHeaderView.self, for: indexPath)
            header.configure(title: "우리 동네 한그릇 인기 랭킹")
            return header
            
        case .recentOrder:
            let header: StoreSectionHeaderView = collectionView.dequeueHeader(StoreSectionHeaderView.self, for: indexPath)
            header.configure(title: "최근에 주문했어요")
            return header
            
        case .discountStore:
            let header: StoreSectionHeaderView = collectionView.dequeueHeader(StoreSectionHeaderView.self, for: indexPath)
            header.configure(title: "무조건 할인하는 가게")
            return header
            
        default:
            return UICollectionReusableView()
        }
    }
}
