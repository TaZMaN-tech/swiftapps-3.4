//
//  ContentView.swift
//  SliderGameApp
//
//  Created by Тадевос Курдоглян on 19.09.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = Double.random(in: 1...100)
    @State private var targetValue = Int.random(in: 1...100)
    @State private var score = 0
    
    @State private var showAlert: Bool = false

    
    var body: some View {
        VStack {
            HStack {
                Text("Подвиньте слайдер, как можно ближе к:")
                    .lineLimit(1)
                Text("\(targetValue)")
            }
            CustomSlider(currentValue: $currentValue)
                .padding()
            Button("Проверь меня") {
                score = computeScore()
                showAlert.toggle()
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Ваш счет"), message: Text("\(score)"))
            }
            .padding(.bottom)
            Button("Начать заново") {
                targetValue = Int.random(in: 1...100)
            }
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
        
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
