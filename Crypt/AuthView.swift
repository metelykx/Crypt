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
                                    .onChange(of: password) { _ in
                                            if isError != nil {
                                                isError = nil
                                            }
                                        }
                                
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
                                SecureField("", text: $repeatPass)
                                    .onChange(of: repeatPass) { _ in
                                            if isError != nil {
                                                isError = nil
                                            }
                                        }
                            }.padding(.bottom)
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
                    
                    //-MARK: Button for authorization
                    ButtonView(size: geometry.size)
                        .onTapGesture {
                            authorization()
                        }
                    
                    Spacer()
                }.padding(.bottom, geometry.size.height * 0.15)
        
            }
        }.background(.primary)
    }
    
    //-MARK: Functions
    
    //function for authorization
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
    
    
    //function for validate passwords
    private func validatePassword() -> Bool {
        // Проверяем все поля
        guard !name.isEmpty else {
            isError = "Please enter your name"
            return false
        }
        
        guard !password.isEmpty else {
            isError = "Please enter password"
            return false
        }
        
        guard !repeatPass.isEmpty else {
            isError = "Please repeat password"
            return false
        }
        
        // Проверяем совпадение паролей
        guard password == repeatPass else {
            isError = "Passwords do not match"
            return false
        }
        
        // Проверяем минимальную длину пароля
        guard password.count >= 6 else {
            isError = "Password must be at least 6 characters"
            return false
        }
        
        isError = nil
        return true
    }
}
#Preview {
    AuthView()
       
}







