//
//  ContentView.swift
//  CatchNumber
//
//  Created by Andrey Kovalev on 21.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = Double.random(in: 0...100)
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Подвинь слайдер, как можно ближе к: \(targetValue)")
                .padding(.bottom, 40)
            HStack {
                Text("0")
                SliderFromUIKitView(currentValue: $currentValue, alpha: computeScrore())
                Text("100")
            }
            .padding()
            
            ButtonView(action: {showAlert.toggle()},
                       title: "Проверь меня",
                       image: "person.crop.circle.badge.checkmark")
            .padding(40)
            .alert("Your Score", isPresented: $showAlert, actions: {}) {
                Text(computeScrore().formatted())
            }
            
            ButtonView(action: {targetValue = Int.random(in: 0...100)
                currentValue = Double.random(in: 0...100)},
                       title: "Начать заново",
                       image: "repeat.circle.fill")
        }
    }
    
    private func computeScrore() -> Int {
        let differences = abs(targetValue - lround(Double(currentValue)))
        return 100 - differences
    }
}

#Preview {
    ContentView()
}
