//
//  RecentOrderCard.swift
//  Baemin
//
//  Created by 안치욱 on 12/12/25.
//

import SwiftUI

struct RecentOrder: Identifiable {
    let id = UUID()
    let thumbnail: String
    let name: String
    let rating: Double
    let reviewCount: Int
    let deliveryTime: String
    let deliveryPrice: String
}

struct RecentOrderCard: View {
    let recentOrder: RecentOrder
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Image(recentOrder.thumbnail)
                .resizable()
                .scaledToFill()
                .frame(width: 188, height: 126)
                .background(.baeminWhiteBg)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.bottom, 8)
            Image(.orderOnce)
            HStack {
                Text(recentOrder.name)
                    .font(.head_b_14)
                    .foregroundColor(.baeminBlack)
                    .lineLimit(1)
                Spacer()
                HStack(spacing: 2) {
                    Image(.iconStar)
                    Text(String(format: "%.1f", recentOrder.rating))
                        .font(.head_b_14)
                        .foregroundColor(.baeminBlack)
                        .lineLimit(1)
                    Text("(\(recentOrder.reviewCount.formatted()))")
                        .font(.body_r_14)
                        .foregroundColor(.baeminGray600)
                        .lineLimit(1)
                }
                
            }

            HStack(spacing: 4) {
                Image(.iconMoney)
                    .resizable()
                    .frame(width: 13, height: 13)
                Text(recentOrder.deliveryTime)
                    .font(.body_r_13)
                    .foregroundColor(.baeminBlack)
                    .lineLimit(1)
                Image(.iconClub)
                    .resizable()
                    .frame(width: 12, height: 12)
                Text(recentOrder.deliveryPrice)
                    .font(.head_b_13)
                    .foregroundColor(.baeminPurple)
                Spacer(minLength: 0)
            }

            HStack(spacing: 4) {
                Image(.baeminclub)
                Image(.pickup)
            }
        }
        .padding(12)
        .background(.clear)
        .frame(width: 200)
    }
}



struct RecentCardView: View {
    let recent: [RecentOrder] = [
        .init(thumbnail: "recent1", name: "신", rating: 5.0, reviewCount: 7777, deliveryTime: "12~33분", deliveryPrice: "무료배달"),
        .init(thumbnail: "recent2", name: "레나", rating: 5.0, reviewCount: 7777, deliveryTime: "12~33분", deliveryPrice: "무료배달"),
        .init(thumbnail: "recent3", name: "에이티식스!", rating: 5.0, reviewCount: 5555, deliveryTime: "31~46분", deliveryPrice: "무료배달"),
        .init(thumbnail: "recent4", name: "파이드파이드", rating: 5.0, reviewCount: 4321, deliveryTime: "12~33분", deliveryPrice: "무료배달"),
        .init(thumbnail: "recent5", name: "파파이이드드", rating: 5.0, reviewCount: 1111, deliveryTime: "50~75분", deliveryPrice: "3,000원")
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(recent) {
                    RecentOrderCard(recentOrder: $0)
                }
            }
            .padding(.horizontal)
        }
    }
}
