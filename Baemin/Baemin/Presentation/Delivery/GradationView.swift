//
//  GradationView.swift
//  Baemin
//
//  Created by 안치욱 on 12/9/25.
//

import SwiftUI

struct GradationView: View {
    var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(colors: [.baeminWhiteBg, .baeminMint300], startPoint: .top, endPoint: .center)
            VStack {
                HStack {
                    Image(.bMart)
                    Spacer()
                }
                HStack {
                    Text("전상품 쿠폰팩 + 60%특가")
                        .font(.head_b_16)
                    Button {
                        
                    } label: {
                        Image(.moreButton)
                    }
                    Spacer()
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 24)
        }
        .frame(height: 360)
    }
}

