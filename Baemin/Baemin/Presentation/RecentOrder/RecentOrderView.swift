//
//  RecentOrderView.swift
//  Baemin
//
//  Created by 안치욱 on 12/12/25.
//

import SwiftUI

struct RecentOrderView: View {
    var body: some View {
        VStack {
            HStack {
                Text("최근에 주문했어요")
                    .font(.title_sb_18)
                Button {
                } label: {
                    Image(.iconInfoGr)
                }
                Spacer()
                Button {
                } label: {
                    Text("전체보기")
                        .font(.body_r_14)
                        .foregroundColor(.baeminBlack)
                    Image(.moreButton)
                }
            }
            .padding(.top, 20)
            .padding(.horizontal, 16)
            
            RecentCardView()
        }
        .background(.baeminWhite)
        .padding(.vertical, 16)
    }
}
