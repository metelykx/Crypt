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
                    Label("Statistics", systemImage: "arrow.down.left.arrow.up.right.circle.fill")
                    
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
            
        }
    }
}


#Preview {
    MainView()
}
