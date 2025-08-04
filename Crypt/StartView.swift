//
//  StartView.swift
//  Crypt
//
//  Created by Denis Ivaschenko on 04.08.2025.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        Text("alala")
        ZStack {
            
            GeometryReader { geometry in
                Circle1View(size: geometry.size)
                Circle2View(size: geometry.size)
                
                HStack {
                    Text("Hello! I'm Crypto. Who are you?")
                }
            }
        }
    }
}

#Preview {
    StartView()
}
