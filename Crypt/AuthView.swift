//
//  AuthView.swift
//  Crypt
//
//  Created by Denis Ivaschenko on 04.08.2025.
//

//
//  AuthView.swift
//  CryptoGraf
//
//  Created by Denis Ivaschenko on 04.08.2025.
//
import SwiftUI
import CoreData
struct AuthView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State var name: String = ""
    @State var password: String = ""
    @State var repeatPass: String = ""
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack {
                    HeaderView(sizes: geometry.size)
                    ZStack {
                        
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: geometry.size.width/1.1, height: geometry.size.height/4)
                            .cornerRadius(20)
                        
                        
                        VStack {
                            HStack {
                                Image(systemName: "person.fill")
                                TextField("Name", text: $name)
                                
                                
                            }.padding(.bottom)
                                .padding(.horizontal)
                                .padding(.leading)
                                .padding(.trailing)
                            
                            
                            HStack {
                                Image(systemName: "lock.fill")
                                SecureField("Password", text: $password) }.padding(.bottom)
                                .padding(.horizontal)
                                .padding(.leading)
                                .padding(.trailing)
                            
                            
                            
                            
                            HStack {
                                Image(systemName: "lock.circle.fill")
                                SecureField("Repeat Password", text: $repeatPass) }.padding(.bottom)
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
    AuthView()
}

struct HeaderView: View {
    let sizes: CGSize
    var body: some View {
        HStack {
            Text("Welcome to Crypt")
                .font(.title)
                .bold()
                .fontWidth(.compressed)
                .foregroundStyle(.primary)
            
            Image(systemName: "bitcoinsign.bank.building.fill")
                .resizable()
                .frame(width: sizes.width / 10, height: sizes.height / 20)
                .foregroundStyle(.primary)
        }
    }
}
