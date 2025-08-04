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
        GeometryReader { geometry in
            VStack {
                
                Text("Welcome to Crypt")
                    .font(.title)
                    .bold()
                    .fontWidth(.compressed)
                    .foregroundStyle(.primary)
                
                HStack {
                    Image(systemName: "person.fill")
                    TextField("Name", text: $name) }
                
                
                HStack { SecureField("Password", text: $password) }
                
                
                
                
                HStack { SecureField("Repeat Password", text: $repeatPass) }
                
                
                
            }.frame(
                width: geometry.size.width,
                height: geometry.size.height / 2,
                alignment: .center
            )
        }
    }
}
#Preview {
    AuthView()
}
