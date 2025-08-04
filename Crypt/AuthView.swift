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
        
        VStack {
            
            Text("Welcome to Crypt")
                .font(.title)
                .bold()
                .fontWidth(.compressed)
                .foregroundStyle(.primary)
            
            VStack {
                HStack {
                    Image(systemName: "person.fill")
                    TextField("Name", text: $name) }.padding(.bottom)
                
                
                HStack {
                    Image(systemName: "lock.fill")
                    SecureField("Password", text: $password) }.padding(.bottom)
                
                
                
                
                HStack {
                    Image(systemName: "lock.circle.fill")
                    SecureField("Repeat Password", text: $repeatPass) }.padding(.bottom)
                
                
                
            }
        }
    }
}
#Preview {
    AuthView()
}
