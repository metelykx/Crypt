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
                Text("Welcome to Crypto")
                TextField("Name", text: $name)
                TextField("Password", text: $password)
                TextField("Repeat Password", text: $repeatPass)
            }
        }
    }
}
#Preview {
    AuthView()
}
