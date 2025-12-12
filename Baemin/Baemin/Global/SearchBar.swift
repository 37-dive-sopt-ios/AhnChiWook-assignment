//
//  SearchBar.swift
//  Baemin
//
//  Created by 안치욱 on 12/9/25.
//

import SwiftUI

struct SearchBar: View {
    var body: some View {
        HStack {
            HStack {
                Text("찾아라! 맛있는 음식과 맛집")
                    .font(.body_r_14)
                    .foregroundStyle(.baeminGray300)
                Spacer()
                Image(.iconSearch)
            }
            .padding(.horizontal, 17)
            .padding(.vertical, 13)
            .background(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(.baeminBlack, lineWidth: 1)
            )
        }
        .padding(.horizontal, 16)
    }
}
