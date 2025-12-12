//
//  BannerView.swift
//  Baemin
//
//  Created by 안치욱 on 12/12/25.
//

import SwiftUI

import Combine

struct BannerView: View {
    let banners: [String] = ["banner1", "banner2", "banner3", "banner4"]
    @State private var currentIndex = 0
    
    private let timer = Timer
        .publish(every: 3, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(banners.indices, id: \.self) { index in
                Image(banners[index])
                    .resizable()
                    .scaledToFill()
                    .frame(height: 160)
                    .clipped()
                    .tag(index)
            }
        }
        .padding(.bottom, 20)
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 160)
        .onReceive(timer) { _ in
            guard !banners.isEmpty else { return }
            withAnimation {
                currentIndex = (currentIndex + 1) % banners.count
            }
        }
    }
}
