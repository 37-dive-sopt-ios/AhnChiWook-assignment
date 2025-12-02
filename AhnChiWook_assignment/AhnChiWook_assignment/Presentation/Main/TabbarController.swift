//
//  TabbarController.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 11/14/25.
//

import UIKit

final class TabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    private func setTabBar() {
        let homeVC = HomeView()
        homeVC.tabBarItem = UITabBarItem(title: "홈", image: .tabbar1, selectedImage: .tabbar1)
        
        let shopVC = ShopView()
        shopVC.tabBarItem = UITabBarItem(title: "장보기·쇼핑", image: .tabbar2, selectedImage: .tabbar2)
        
        let dibVC = DibView()
        dibVC.tabBarItem = UITabBarItem(title: "찜", image: .tabbar3, selectedImage: .tabbar3)
        
        let orderVC = OrderView()
        orderVC.tabBarItem = UITabBarItem(title: "주문내역", image: .tabbar4, selectedImage: .tabbar4)
        
        let myPageVC = MypageView()
        myPageVC.tabBarItem = UITabBarItem(title: "마이배민", image: .tabbar5, selectedImage: .tabbar5)
        
        viewControllers = [homeVC, shopVC, dibVC, orderVC, myPageVC]
        
        self.tabBar.tintColor = .baeminMint500
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .baeminWhite

        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = tabBar.standardAppearance
    }
}

