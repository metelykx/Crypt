//
//  RecordView.swift
//  Crypt
//
//  Created by Denis Ivaschenko on 06.08.2025.
//

import SwiftUI

struct RecordView: View {
    @State var isTrue = false
    var body: some View {
        VStack {
            Text("Your Records")
                .font(.title)
                .padding()
            Spacer()
            
            Button {
                isTrue = true
            } label: {
                Text("Create a new record")
            }.sheet(isPresented: $isTrue) {
                CreateRecordView()
            }


        }
    }
}
#Preview {
    RecordView()
}
