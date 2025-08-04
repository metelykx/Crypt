//
//  StartView.swift
//  Crypt
//
//  Created by Denis Ivaschenko on 04.08.2025.
//

import SwiftUI

struct StartView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    private var colors: Color {
        colorScheme == .dark ? .white : .black
    }
    @State var name: String = ""
    @State var password: String = ""
    @Environment(\.managedObjectContext) var managedObjectContext
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
                            .foregroundStyle(colors)
                        
                        Image(systemName: "bitcoinsign.bank.building.fill")
                            .resizable()
                            .frame(width: geometry.size.width / 10, height: geometry.size.height / 20)
                            .foregroundStyle(.yellow)
                    }
                    ZStack{
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: geometry.size.width/1.1, height: geometry.size.height/6)
                            .cornerRadius(20)
                        
                        VStack {
                            HStack {
                                Image(systemName: "person.fill")
                                    .foregroundStyle(colors)
                                Text("Name")
                                    .foregroundStyle(colors)
                                    .font(.headline)
                                TextField("", text: $name)
                                
                                
                            }.padding(.bottom)
                                .padding(.horizontal)
                                .padding(.leading)
                                .padding(.trailing)
                            
                            
                            HStack {
                                Image(systemName: "lock.fill").foregroundStyle(colors)
                                Text("Password")
                                    .foregroundStyle(colors)
                                    .font(.headline)
                                SecureField("", text: $password)
                                
                            }
                            .padding(.bottom)
                            .padding(.horizontal)
                            .padding(.leading)
                            .padding(.trailing)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    StartView()
}
