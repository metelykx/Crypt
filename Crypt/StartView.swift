//
//  StartView.swift
//  Crypt
//
//  Created by Denis Ivaschenko on 04.08.2025.
//

import SwiftUI

struct StartView: View {
    @Environment(\.colorScheme) private var colorScheme
    private var textColor: Color {
        colorScheme == .dark ? .white : .black
    }
    var body: some View {
        ZStack {
            
            GeometryReader { geometry in
                Circle1View(size: geometry.size)
                Circle2View(size: geometry.size)
                
                HStack {
                    Text("Crypto")
                        .font(.title)
                        .bold()
                        .fontWidth(.compressed)
                        .foregroundStyle(textColor)
                    
                    Image(systemName: "bitcoinsign.bank.building.fill")
                        .resizable()
                        .frame(width: geometry.size.width / 10, height: geometry.size.height / 20)
                        .foregroundStyle(.yellow)
                }
            }
        }
    }
}

#Preview {
    StartView()
}
