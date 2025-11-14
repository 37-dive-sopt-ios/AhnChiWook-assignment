//
//  HomeView.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 11/14/25.
//

import UIKit

import SnapKit
import Then


//final class HomeView: BaseViewController {
//    
//    // MARK: - Properties
//    
//    private let naviBar = HomeNavigationBar()
//    private let searchBar = SearchBar()
//    private let collectionView = UICollectionView(
//        frame: .zero,
//        collectionViewLayout: HomeLayoutFactory.layout()
//    )
//    
//    private var currentTab: SegmentTab = .delivery
//    private var categories = HomeDummyData.categories
//    private var brands = HomeDummyData.brands
//    
//    
//    override func setStyle() {
//        view.backgroundColor = .baeminWhiteBg
//    }
//    
//    override func setUI() {
//        view.addSubviews(
//            naviBar,
//            searchBar,
//            collectionView
//        )
//    }
//    
//    override func setLayout() {
//        naviBar.snp.makeConstraints {
//            $0.horizontalEdges.equalToSuperview().inset(16)
//            $0.top.equalTo(view.safeAreaLayoutGuide)
//            $0.height.equalTo(24)
//        }
//        
//        searchBar.snp.makeConstraints {
//            $0.top.equalTo(naviBar.snp.bottom).offset(10)
//            $0.horizontalEdges.equalTo(naviBar)
//            $0.height.equalTo(40)
//        }
//        
//        collectionView.snp.makeConstraints {
//            $0.top.equalTo(searchBar.snp.bottom).offset(89)
//            $0.horizontalEdges.equalToSuperview()
//            $0.height.equalTo(339)
//        }
//    }
//    
//    override func setDelegate() {
//        collectionView.delegate = self
//        collectionView.dataSource = self
//                
//        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseId)
//        collectionView.register(BrandCell.self, forCellWithReuseIdentifier: BrandCell.reuseId)
//        collectionView.register(MoreButtonCell.self, forCellWithReuseIdentifier: MoreButtonCell.reuseId)
//        
//        collectionView.register(
//            SegmentHeaderView.self,
//            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
//            withReuseIdentifier: SegmentHeaderView.reuseId
//        )
//    }
//    
//    
//}
//
//
//extension HomeView: UICollectionViewDataSource, UICollectionViewDelegate {
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return HomeSection.allCases.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        numberOfItemsInSection section: Int) -> Int {
//        
//        switch HomeSection(rawValue: section)! {
//        case .segmentHeader: return 0
//        case .category: return categories[currentTab]?.count ?? 0
//        case .moreButton: return 1
//        case .brand: return brands.count
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        switch HomeSection(rawValue: indexPath.section)! {
//            
//        case .category:
//            let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: CategoryCell.reuseId,
//                for: indexPath
//            ) as! CategoryCell
//            let data = categories[currentTab]![indexPath.row]
//            cell.configure(data)
//            return cell
//            
//        case .moreButton:
//            let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: MoreButtonCell.reuseId,
//                for: indexPath
//            ) as! MoreButtonCell
//            cell.configure(currentTab)
//            return cell
//            
//        case .brand:
//            let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: BrandCell.reuseId,
//                for: indexPath
//            ) as! BrandCell
//            let data = brands[indexPath.row]
//            cell.configure(data)
//            return cell
//            
//        default:
//            fatalError("No items in header section")
//        }
//    }
//    
//    // 헤더 뷰
//    func collectionView(_ collectionView: UICollectionView,
//                        viewForSupplementaryElementOfKind kind: String,
//                        at indexPath: IndexPath) -> UICollectionReusableView {
//        
//        switch HomeSection(rawValue: indexPath.section)! {
//        case .segmentHeader:
//            let header = collectionView.dequeueReusableSupplementaryView(
//                ofKind: kind,
//                withReuseIdentifier: SegmentHeaderView.reuseId,
//                for: indexPath
//            ) as! SegmentHeaderView
//            
//            header.onTabChanged = { [weak self] tab in
//                self?.currentTab = tab
//                self?.collectionView.reloadSections(IndexSet(integer: 1))
//                self?.collectionView.reloadSections(IndexSet(integer: 2))
//            }
//            return header
//            
//        default:
//            return UICollectionReusableView()
//        }
//    }
//}

final class HomeView: BaseViewController {
    
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
            $0.bottom.equalToSuperview()   // 높이 고정 대신 bottom까지
        }
    }
    
    override func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(CategoryPageCell.self,
                                forCellWithReuseIdentifier: CategoryPageCell.reuseId)
        collectionView.register(BrandCell.self,
                                forCellWithReuseIdentifier: BrandCell.reuseId)
        collectionView.register(MoreButtonCell.self,
                                forCellWithReuseIdentifier: MoreButtonCell.reuseId)
        
        collectionView.register(
            SegmentHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SegmentHeaderView.reuseId
        )
    }
    
    // MARK: - Helpers
    
    /// 가로 페이지 스크롤 → Segment 변경 & 더보기 텍스트 변경
    private func handleCategoryPageChanged(pageIndex: Int) {
        guard let tab = SegmentTab(rawValue: pageIndex) else { return }
        currentTab = tab
        
        // 헤더 찾아서 선택 변경
        let headerIndexPath = IndexPath(item: 0, section: HomeSection.segmentHeader.rawValue)
        if let header = collectionView.supplementaryView(
            forElementKind: UICollectionView.elementKindSectionHeader,
            at: headerIndexPath
        ) as? SegmentHeaderView {
            header.selectTab(pageIndex, animated: true)
        } else {
            // 아직 헤더가 안 만들어졌으면 reload로 해결
            collectionView.reloadSections(IndexSet(integer: HomeSection.segmentHeader.rawValue))
        }
        
        // 더보기 섹션 업데이트
        collectionView.reloadSections(IndexSet(integer: HomeSection.moreButton.rawValue))
    }
}

extension HomeView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        HomeSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        guard let sec = HomeSection(rawValue: section) else { return 0 }
        
        switch sec {
        case .segmentHeader:
            return 0
        case .category:
            return SegmentTab.allCases.count  // 각 탭 = 한 페이지
        case .moreButton:
            return 1
        case .brand:
            return brands.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sec = HomeSection(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }
        
        switch sec {
        case .category:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CategoryPageCell.reuseId,
                for: indexPath
            ) as! CategoryPageCell
            
            let tab = SegmentTab(rawValue: indexPath.item)!
            let items = categories[tab] ?? []
            cell.configure(items)
            return cell
            
        case .moreButton:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MoreButtonCell.reuseId,
                for: indexPath
            ) as! MoreButtonCell
            cell.configure(currentTab)
            return cell
            
        case .brand:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BrandCell.reuseId,
                for: indexPath
            ) as! BrandCell
            cell.configure(brands[indexPath.item])
            return cell
            
        case .segmentHeader:
            fatalError("segmentHeader section has no cells")
        }
    }
    
    // 헤더
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let section = HomeSection(rawValue: indexPath.section),
              section == .segmentHeader else {
            return UICollectionReusableView()
        }
        
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: SegmentHeaderView.reuseId,
            for: indexPath
        ) as! SegmentHeaderView
        
        header.onTabChanged = { [weak self] tab in
            guard let self else { return }
            self.currentTab = tab
            
            // 탭 → 페이지로 이동
            let indexPath = IndexPath(item: tab.rawValue,
                                      section: HomeSection.category.rawValue)
            self.collectionView.scrollToItem(at: indexPath,
                                             at: .centeredHorizontally,
                                             animated: true)
            
            // 더보기 섹션 갱신
            self.collectionView.reloadSections(
                IndexSet(integer: HomeSection.moreButton.rawValue)
            )
        }
        
        // 화면 처음 그릴 때 currentTab에 맞게 선택
        header.selectTab(currentTab.rawValue, animated: false)
        
        return header
    }
}
