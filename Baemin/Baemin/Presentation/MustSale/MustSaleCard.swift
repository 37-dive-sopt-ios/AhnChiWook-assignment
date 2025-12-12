//
//  MustSaleCard.swift
//  Baemin
//
//  Created by 안치욱 on 12/12/25.
//

import SwiftUI

struct MustSale: Identifiable {
    let id = UUID()
    let thumbnail: String
    let name: String
    let rating: Double
    let reviewCount: Int
    let deliveryTime: String
    let deliveryPrice: String
}

struct SaleCard: View {
    let mustSale: MustSale
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Image(mustSale.thumbnail)
                .resizable()
                .scaledToFill()
                .frame(width: 188, height: 126)
                .background(.baeminWhiteBg)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.bottom, 8)
            HStack {
                Text(mustSale.name)
                    .font(.head_b_14)
                    .foregroundColor(.baeminBlack)
                    .lineLimit(1)
                Spacer()
                HStack(spacing: 2) {
                    Image(.iconStar)
                    Text(String(format: "%.1f", mustSale.rating))
                        .font(.head_b_14)
                        .foregroundColor(.baeminBlack)
                        .lineLimit(1)
                    Text("(\(mustSale.reviewCount.formatted()))")
                        .font(.body_r_14)
                        .foregroundColor(.baeminGray600)
                        .lineLimit(1)
                }
                
            }

            HStack(spacing: 4) {
                Image(.iconMoney)
                    .resizable()
                    .frame(width: 13, height: 13)
                Text(mustSale.deliveryTime)
                    .font(.body_r_13)
                    .foregroundColor(.baeminBlack)
                    .lineLimit(1)
                Image(.iconClub)
                    .resizable()
                    .frame(width: 12, height: 12)
                Text(mustSale.deliveryPrice)
                    .font(.head_b_13)
                    .foregroundColor(.baeminPurple)
                Spacer(minLength: 0)
            }

            ChipFlowLayout {
                Image(.baeminclub)
                Image(.coupon)
                Image(.pickup)
                Image(.clean)
            }
        }
        .padding(12)
        .background(.clear)
        .frame(width: 210)
    }
}



struct MustSaleCard: View {
    let must: [MustSale] = [
        .init(thumbnail: "sale1", name: "카마도 탄지로", rating: 5.0, reviewCount: 7777, deliveryTime: "12~33분", deliveryPrice: "무료배달"),
        .init(thumbnail: "sale2", name: "하시비라 이노스케", rating: 5.0, reviewCount: 7777, deliveryTime: "12~33분", deliveryPrice: "무료배달"),
        .init(thumbnail: "sale3", name: "토키토 무이치로", rating: 5.0, reviewCount: 5555, deliveryTime: "31~46분", deliveryPrice: "무료배달"),
        .init(thumbnail: "sale4", name: "렌코쿠 쿄주로", rating: 5.0, reviewCount: 4321, deliveryTime: "12~33분", deliveryPrice: "무료배달"),
        .init(thumbnail: "sale5", name: "토미오카 기유", rating: 5.0, reviewCount: 1111, deliveryTime: "50~75분", deliveryPrice: "3,000원")
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(must) {
                    SaleCard(mustSale: $0)
                }
            }
            .padding(.horizontal)
        }
    }
}
