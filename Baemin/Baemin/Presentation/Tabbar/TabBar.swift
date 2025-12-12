//
//  TabBar.swift
//  Baemin
//
//  Created by 안치욱 on 12/9/25.
//

import SwiftUI

struct TabBar: View {
    @Binding var selected: Int

    var body: some View {
        HStack {
            tabItem(index: 0, title: "홈", icon: Image(.iconHome))
            Spacer()
            tabItem(index: 1, title: "장보기·쇼핑", icon: Image(.iconShopping))
            Spacer()
            tabItem(index: 2, title: "찜", icon: Image(.iconHeart))
            Spacer()
            tabItem(index: 3, title: "주문내역", icon: Image(.iconOrder))
            Spacer()
            tabItem(index: 4, title: "마이배민", icon: Image(.iconChuberub))
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 14)
        .background(Color.white)
        .shadow(color: .black.opacity(0.1), radius: 4, y: -1)
    }

    @ViewBuilder
    func tabItem(index: Int, title: String, icon: Image) -> some View {
        let isSelected = selected == index

        VStack(spacing: 5) {
            icon
                .renderingMode(.template)
                .foregroundColor(isSelected ? Color.baeminBlack : Color.baeminGray700)

            Text(title)
                .font(isSelected ? .title_sb_10 : .body_r_10)
                .foregroundColor(isSelected ? Color.baeminBlack : Color.baeminGray700)
        }
        .onTapGesture {
            selected = index
        }
    }
}

