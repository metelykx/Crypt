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
    @State var isError: String? = nil
    
    //-MARK: View
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                
                //MARK: -Circles
                Circle1View(size: geometry.size)
                Circle2View(size: geometry.size)
                    
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
                                SecureField("", text: $password)
                                
                            }
                    .padding(.bottom)
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
                    if let error = isError {
                        Text(error)
                            .font(.callout)
                            .padding(.top)
                            .foregroundColor(.red)
                    }
                    ButtonView(size: geometry.size)
                    
                    Spacer()
                }.padding(.bottom, geometry.size.height * 0.15)
        
            }
        }.background(.primary)
    }
    
    //-MARK: Function
    private func authorization() {
        guard validatePassword() else { return }
        let newItem = Item(context: managedObjectContext)
        
        newItem.name = name
        newItem.password = password
        newItem.repeatPass = repeatPass
        
        do {
            try managedObjectContext.save()
        } catch {
            print("Core Data save error: \(error)")
            let nsError = error as NSError
            print("Detailed error: \(nsError.userInfo)")
        }
    }
    
    private func validatePassword() -> Bool {
        guard !password.isEmpty && !repeatPass.isEmpty else {
            isError = "Please fill in all fields"
            return false
        }
        
        guard password == repeatPass else {
            isError = "Passwords do not match"
            return false
        }
        isError = nil
        return true
    }
}
#Preview {
    AuthView()
       
}







