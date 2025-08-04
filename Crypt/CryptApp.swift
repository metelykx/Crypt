//
//  CryptApp.swift
//  Crypt
//
//  Created by Denis Ivaschenko on 04.08.2025.
//

import SwiftUI

@main
struct CryptApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            AuthView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
