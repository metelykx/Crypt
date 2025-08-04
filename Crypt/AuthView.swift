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
                    
                    ButtonView(size: geometry.size)
                    
                }
            }
        }
    }
}
#Preview {
    AuthView()
}


struct ButtonView: View {
    
    let size: CGSize
    var body: some View {
        Button {
            print("Sign Up tapped")
        } label: {
            Text("Sign Up")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding(.vertical, size.height * 0.03)
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(12)
        .padding(.horizontal, size.width * 0.2)
        .padding(.top, size.height * 0.03)
    }
}
