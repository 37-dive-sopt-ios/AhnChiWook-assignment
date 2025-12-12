//
//  NavigationBar.swift
//  Baemin
//
//  Created by 안치욱 on 12/9/25.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack {
            HStack(spacing: 3) {
                Text("우리집")
                    .font(.head_b_16)
                Button {
                    
                } label: {
                    Image(.btnDown)
                }
            }
            
            Spacer()
            
            HStack(spacing: 12) {
                Image(.iconDiscount)
                Image(.iconBell)
                Image(.iconCart)
            }
        }
        .padding(.horizontal, 16)
    }
}

