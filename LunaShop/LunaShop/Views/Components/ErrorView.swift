//
//  ErrorView.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 14/04/25.
//

import SwiftUI

struct ErrorView: View {
    let message: String
    let onTap: () -> Void

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 16) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.orange)

                Text(message)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)

                Button(action: onTap) {
                    Text("Reintentar")
                        .padding(.horizontal, 24)
                        .padding(.vertical, 10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .contentShape(Rectangle()) 
        }
    }
}
