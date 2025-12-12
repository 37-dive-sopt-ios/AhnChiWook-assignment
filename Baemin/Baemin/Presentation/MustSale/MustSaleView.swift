//
//  MustSaleView.swift
//  Baemin
//
//  Created by 안치욱 on 12/12/25.
//

import SwiftUI

struct MustSaleView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("무조건 할인하는 가게")
                            .font(.title_sb_18)
                        Image(.iconInfoGr)
                    }
                    Text("2천원 이상 또는 15% 이상 할인중")
                        .font(.body_r_14)
                        .foregroundColor(.baeminGray300)
                }
                Spacer()
                Image(.mustDiscount)
            }
            .padding(.leading, 16)
            .padding(.trailing, 23)
            .padding(.top, 20)
            
            MustSaleCard()
            
            Button {
            } label: {
                HStack(spacing: 4) {
                    Text("할인하는 가게")
                        .font(.head_b_14)
                    Text("더보기")
                        .font(.body_r_14)
                    Image(.moreButton)
                }
                .foregroundColor(.black)
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .background(
                    Capsule()
                        .fill(Color.white)
                )
                .overlay(
                    Capsule()
                        .stroke(Color.gray.opacity(0.35), lineWidth: 1)
                )
            }
            .buttonStyle(.plain)
            .padding(.top, 10)
        }
        .background(.baeminWhite)
    }
}

