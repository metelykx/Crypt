//
//  CreateRecordView.swift
//  Crypt
//
//  Created by Denis Ivaschenko on 07.08.2025.
//

import SwiftUI

struct CreateRecordView: View {
    
    @Environment(\.managedObjectContext) var contexView
    
    @State var title: String = ""
    @State var text: String = ""
    @State var data: Data?
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    
                }
            }
        }
    }
}

#Preview {
    CreateRecordView()
}
