//
//  WooDongHanView.swift
//  Baemin
//
//  Created by 안치욱 on 12/12/25.
//

import SwiftUI

struct WooDongHanView: View {
    var body: some View {
        ZStack (alignment: .top){
            LinearGradient(colors: [.baeminPurple, .baeminWhite], startPoint: .top, endPoint: .center)
            VStack {
                HStack {
                    Text("우리 동네 한그릇 인기 랭킹")
                        .font(.title_sb_18)
                        .foregroundStyle(.baeminWhite)
                        .padding(.leading, 16)
                    Button {
                    } label: {
                        Image(.iconInfoWt)
                    }
                    Spacer()
                    Button {
                    } label: {
                        Text("전체보기")
                            .font(.body_r_14)
                            .foregroundColor(.baeminWhite)
                        Image(.moreButtonWt)
                    }
                    .padding(.trailing, 16)
                }
                RankingCardView()
            }
            .padding(.vertical, 24)
        }
        .frame(height: 350)
    }
}
