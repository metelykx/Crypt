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
    
    @Environment(\.colorScheme) private var colorScheme
    private var colors: Color {
        colorScheme == .dark ? .black : .white
    }
    
    @State var name: String = ""
    @State var password: String = ""
    @State var repeatPass: String = ""
    @State var isValid: Bool = false
    
    //-MARK: View
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                
                Circle1View(size: geometry.size)
                
                Circle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                    .rotationEffect(.init(degrees: 45))
                    .offset(
                        x: geometry.size.width / 1.6,
                        y: geometry.size.height / 1.3
                    )
                    
                VStack {
                    Spacer()
                    HeaderView(sizes: geometry.size)
                    ZStack {
                        
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: geometry.size.width/1.1, height: geometry.size.height/4)
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
                                SecureField("", text: $password) }.padding(.bottom)
                                .padding(.horizontal)
                                .padding(.leading)
                                .padding(.trailing)
                            
                            
                            HStack {
                                Image(systemName: "lock.circle.fill").foregroundStyle(colors)
                                Text("Repeat")
                                    .foregroundStyle(colors)
                                    .font(.headline)
                                SecureField("", text: $repeatPass) }.padding(.bottom)
                                .padding(.horizontal)
                                .padding(.leading)
                                .padding(.trailing)
                            
                            
                        }
                    }
                    //-MARK: Mistakes
                    Text("Mistake")
                        .font(.callout)
                        .padding(.top)
                        .foregroundStyle(colors)
                    ButtonView(size: geometry.size)
                    
                    Spacer()
                }.padding(.bottom, geometry.size.height * 0.15)
        
            }
        }.background(.primary)
    }
}
#Preview {
    AuthView()
       
}


struct Circle1View: View {
    let size: CGSize
    var body: some View {
        Circle()
            .fill(Color.gray.opacity(0.2))
            .frame(width: size.width / 2, height: size.height / 2)
            .rotationEffect(.init(degrees: 45))
            .offset(
                x: -size.width / 4,
                y: -size.height / 4
            )
    }
}


