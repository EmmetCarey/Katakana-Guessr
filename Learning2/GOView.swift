import SwiftUI
import Foundation

struct GOView: View {
    @State private var nextPage = false
    @State private var buttonOffsetY: CGFloat = 0
    @State private var offset: CGFloat = 600
    @State private var timeOffset = 0.3
    @State private var backgroundOpacity = 0.0 // New @State variable for opacity

    var body: some View {
        ZStack {
            Color.Beige.edgesIgnoringSafeArea(.all)
            BackgroundView() // Use BackgroundView without modifying its opacity directly
                .opacity(backgroundOpacity) // Apply opacity based on backgroundOpacity state

            VStack {
                Button(action: {
                    withAnimation(.easeInOut) {
                        buttonOffsetY = -offset
                        backgroundOpacity = 0.0 // Update the background opacity immediately
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        nextPage = true
                    }
                }) {
                    CustomButton(data: "GO", isCircle: true, color: Color.Medium, buttonOffsetY: buttonOffsetY, buttonOffsetX: 0)
                }
            }
            .onAppear {
                withAnimation(.easeInOut) {
                    backgroundOpacity = 1.0 // Update the background opacity immediately
                }
                print(getQuestions(isKat: true, level: 0))
            }
            .fullScreenCover(isPresented: $nextPage) {
                KatHirView()
            }
        }
    }
}


struct GOView_Previews: PreviewProvider {
    static var previews: some View {
        GOView()
    }
}
