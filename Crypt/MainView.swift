//
//  MainView.swift
//  Crypt
//
//  Created by Denis Ivaschenko on 06.08.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            StaticView()
                .tabItem {
                    Image(systemName: "arrow.down.left.arrow.up.right.circle.fill")
                }
        }
    }
}


#Preview {
    MainView()
}
