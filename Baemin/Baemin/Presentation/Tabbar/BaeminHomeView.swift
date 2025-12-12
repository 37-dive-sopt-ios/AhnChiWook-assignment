//
//  BaeminHomeView.swift
//  Baemin
//
//  Created by 안치욱 on 12/9/25.
//

import SwiftUI

struct BaeminHomeView: View {
    var body: some View {
        VStack {
            NavigationBar()
            SearchBar()
            ScrollView {
                VStack(spacing: 0) {
                    DeliveryView()
                    BrandCategoryView()
                    BannerView()
                    WooDongHanView()
                    RecentOrderView()
                    MustSaleView()
                        .padding(.bottom, 10)
                }
            }
        }
        .background(.baeminWhiteBg)
    }
}
