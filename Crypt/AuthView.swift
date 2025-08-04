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
    @State var isValid: Bool = false
    
    //-MARK: View
    var body: some View {
        ZStack {
            GeometryReader { geometry in
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
                    //-MARK: Mistakes
                    Text("Mistake")
                        .font(.callout)
                        .padding(.top)
                    ButtonView(size: geometry.size)
                    
                    Spacer()
                }.padding(.bottom, geometry.size.height * 0.15)
        
            }
        }
    }
}
#Preview {
    AuthView()
}

