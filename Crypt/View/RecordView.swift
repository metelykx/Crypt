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
        GeometryReader { geometry in
            ZStack {
                ScrollView {
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
                        .frame(width: geometry.size.width / 2, height: geometry.size.height/10)
                        .background(Color.accentColor)
                        .cornerRadius(20)
                        .foregroundStyle(.white)
                        .font(.headline)
                        .padding(.bottom)
                        
                    }.frame(width: geometry.size.width, height: geometry.size.height)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
            }
        }
    }
}
#Preview {
    RecordView()
}
