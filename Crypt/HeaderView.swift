//
//  HeaderView.swift
//  Crypt
//
//  Created by Denis Ivaschenko on 04.08.2025.
//
import SwiftUI

struct HeaderView: View {
    let sizes: CGSize
    var body: some View {
        HStack {
            Text("Welcome to Crypt")
                .font(.title)
                .bold()
                .fontWidth(.compressed)
                .foregroundStyle(.primary)
            
            Image(systemName: "bitcoinsign.bank.building.fill")
                .resizable()
                .frame(width: sizes.width / 10, height: sizes.height / 20)
                .foregroundStyle(.primary)
        }
    }
}
