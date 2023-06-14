//
//  BackgroundView.swift
//  Learning2
//
//  Created by Emmet Carey on 12/06/2023.

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Color.Beige.edgesIgnoringSafeArea(.all)
            // Moving Texts Layer
            ForEach(Info.backgroundSymbols, id: \.self) { symbol in
                MovingText(
                    text: symbol,
                    startX: .random(in: -400...400),
                    startY: .random(in: -400...400),
                    direction: .random(in: 0...360),
                    fontSize: Info.fontSizes1.randomElement() ?? 20,
                    speed: Double.random(in: 1...1.16)
                )
            }
            // Any additional background elements or effects can be added here
        }.zIndex(0)
    }
}


struct MovingText: View {
    var text: String
    var startX: CGFloat
    var startY: CGFloat
    var direction: Double
    var fontSize: CGFloat
    var speed: Double
    
    @State private var textPosition: CGSize
    
    init(text: String, startX: CGFloat, startY: CGFloat, direction: Double, fontSize: CGFloat, speed: Double) {
        self.text = text
        self.startX = startX
        self.startY = startY
        self.direction = direction
        self.fontSize = fontSize
        self.speed = speed
        self._textPosition = State(initialValue: CGSize(width: startX, height: startY))
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: fontSize))
            .foregroundColor(Color(UIColor(red: 0.07, green: 0.07, blue: 0.07, alpha: 1.0)))
            .offset(textPosition)
            .zIndex(0)
            .onAppear {
                startTimer()
            }
    }
    
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            withAnimation(Animation.linear(duration: speed)) {
                let angleInRadians = direction * .pi / 180.0
                let deltaX = cos(angleInRadians)
                let deltaY = sin(angleInRadians)
                textPosition.width += deltaX
                textPosition.height += deltaY
            }
        }
    }
}

