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
    @State var name: String = ""
    @State var password: String = ""
    var body: some View {
        ZStack {
            
            GeometryReader { geometry in
                Circle1View(size: geometry.size)
                Circle2View(size: geometry.size)
                
                VStack(alignment: .center){
                    HStack(alignment: .center) {
                        Text("Crypto")
                            .font(.title)
                            .bold()
                            .fontWidth(.compressed)
                            .foregroundStyle(textColor)
                        
                        Image(systemName: "bitcoinsign.bank.building.fill")
                            .resizable()
                            .frame(width: geometry.size.width / 10, height: geometry.size.height / 20)
                            .foregroundStyle(.yellow)
                    }.frame(width: geometry.size.width, height: geometry.size.height)
                    
                    
                }
            }
        }
    }
}

#Preview {
    StartView()
}
