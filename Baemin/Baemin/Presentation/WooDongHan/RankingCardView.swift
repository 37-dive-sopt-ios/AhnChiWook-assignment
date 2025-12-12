//
//  RankingCardView.swift
//  Baemin
//
//  Created by 안치욱 on 12/12/25.
//

import SwiftUI

struct StoreRanking: Identifiable {
    let id = UUID()
    let thumbnail: String
    let name: String
    let desc: String
    let rating: Double
    let reviewCount: Int
    let discountText: String
    let price: String
    let originalPrice: String
    let tag: String
}

struct RankingCard: View {
    let store: StoreRanking

        var body: some View {
            VStack(alignment: .leading, spacing: 4) {
                Image(store.thumbnail)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 145, height: 156)
                    .background(.baeminWhiteBg)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                  //  .padding(.leading, 8)
                
                HStack {
                    Text(store.desc)
                        .font(.body_r_12)
                        .foregroundColor(.baeminGray600)
                        .lineLimit(1)
                    Spacer()
                    HStack(spacing: 2) {
                        Image(.iconStar)
                        Text(String(format: "%.1f", store.rating))
                            .font(.body_r_12)
                            .foregroundColor(.baeminGray600)
                            .lineLimit(1)
                        Text("(\(store.reviewCount.formatted()))")
                            .font(.body_r_12)
                            .foregroundColor(.baeminGray600)
                            .lineLimit(1)
                    }
                    
                }

                HStack(spacing: 4) {
                    Text(store.name)
                        .font(.body_r_14)
                        .foregroundColor(.baeminBlack)
                        .lineLimit(1)
                    Spacer(minLength: 0)
                }

                HStack(spacing: 4) {
                    Text(store.discountText)
                        .font(.head_b_14)
                        .foregroundColor(.red)

                    Text(store.price)
                        .font(.head_b_14)
                }
                
                Text(store.originalPrice)
                    .font(.body_r_12)
                    .foregroundColor(.baeminGray600)
                    .strikethrough()

                Text(store.tag)
                    .font(.head_b_13)
                    .foregroundColor(.baeminPurple)
            }
            .padding(12)
            .background(.clear)
            .frame(width: 172)
        }
}

struct RankingCardView: View {
    let stores: [StoreRanking] = [
        .init(thumbnail: "rank1", name: "아키", desc: "여우의 먹방", rating: 4.7, reviewCount: 1234, discountText: "30%", price: "70,000원", originalPrice: "100,000원", tag: "최소주문금액 없음"),
        .init(thumbnail: "rank2", name: "컹", desc: "여우의 먹방", rating: 4.7, reviewCount: 8740, discountText: "25%", price: "75,000원", originalPrice: "100,000원", tag: "최소주문금액 없음"),
        .init(thumbnail: "rank3", name: "요이키 텐카이", desc: "주령 먹방", rating: 4.7, reviewCount: 2761, discountText: "20%", price: "80,000원", originalPrice: "100,000원", tag: "최소주문금액 없음"),
        .init(thumbnail: "rank4", name: "샤케", desc: "주먹밥 먹기", rating: 4.7, reviewCount: 2222, discountText: "30%", price: "70,000원", originalPrice: "100,000원", tag: "최소주문금액 없음"),
        .init(thumbnail: "rank5", name: "유타", desc: "무례하긴 순애야", rating: 4.7, reviewCount: 1111, discountText: "30%", price: "70,000원", originalPrice: "100,000원", tag: "최소주문금액 없음")
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(stores) {
                    RankingCard(store: $0)
                }
            }
            .padding(.horizontal)
        }
    }
}
