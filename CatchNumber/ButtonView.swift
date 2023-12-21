//
//  ButtonView.swift
//  CatchNumber
//
//  Created by Andrey Kovalev on 22.12.2023.
//

import SwiftUI

struct ButtonView: View {
    
    let action: () -> ()
    let title: String
    let image: String
    
    var body: some View {
        Button(action: action) {
            Text(title)
            Image(systemName: image)
        }
        .foregroundColor(.white)
        .frame(width: 155, height: 35)
        .background(.gray)
        .cornerRadius(15)
        .shadow(color: .blue, radius: 4)
    }
}

#Preview {
    ButtonView(action: {}, title: "Hello", image: "hand.raised.circle.fill")
}
