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
                ScrollView {
                    VStack {
                        Text("Create Record")
                            .font(.title)
                            .padding()
                        
                            HStack {
                                Image(systemName: "circle.hexagonpath.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:geometry.size.width/10)
                                
                                Text("Title:")
                                    .font(.title2)
                                    .bold()
                                TextField("", text: $title)
                            }
                        
                        HStack {
                            Image(systemName: "text.alignleft")
                                .resizable()
                                .scaledToFit()
                                .frame(width:geometry.size.width/10)
                            Text("Text:")
                                .font(.title2)
                                .bold()
                            TextField("", text: $text)
                        }
                        
                        HStack {
                            Image(systemName: "calendar.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width:geometry.size.width/10)
                        }
                        
                        
                        
                        Spacer()
                    }.frame(width: geometry.size.width, height: geometry.size.height)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
            }
        }
    }
}
#Preview {
    CreateRecordView()
}
