//
//  Tabview.swift
//  Baemin
//
//  Created by 안치욱 on 12/9/25.
//

import SwiftUI

struct Tabview: View {
    @State private var selected: Int = 0
    
    var body: some View {
        VStack(spacing: 0) {
            Group {
                switch selected {
                case 0: BaeminHomeView()
                case 1: SecondView()
                case 2: ThirdView()
                case 3: FourthView()
                case 4: FifthView()
                default: BaeminHomeView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            TabBar(selected: $selected)
        }
    }
}
