//
//  NameSegmentBar.swift
//  Baemin
//
//  Created by 안치욱 on 12/11/25.
//

import SwiftUI

struct NameSegmentBar: View {
    let segments: [String]
    @Binding var selection: Int
    var indicatorNamespace: Namespace.ID
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ZStack(alignment: .bottom) {
                Divider()
                
                HStack(spacing: 20) {
                    ForEach(segments.indices, id: \.self) { index in
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                                selection = index
                            }
                        } label: {
                            VStack(spacing: 0) {
                                Text(segments[index])
                                    .fixedSize(horizontal: true, vertical: false)
                                    .foregroundColor(selection == index ? .baeminBlack : .baeminGray300)
                                    .font(selection == index ? .head_b_18 : .title_sb_18)
                                    .padding(.bottom, 6)
                                    .padding(.horizontal, 2)
                                
                                if selection == index {
                                    Rectangle()
                                        .frame(height: 5)
                                        .foregroundColor(.black)
                                        .padding(.horizontal, -8)
                                        .matchedGeometryEffect(id: "indicator", in: indicatorNamespace)
                                } else {
                                    Color.clear.frame(height: 2)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top)
            }
            .frame(height: 44)
        }
        
    }
}
