import SwiftUI
import Foundation

struct GOView: View {
    @State private var nextPage = false
    @State private var buttonOffsetY: CGFloat = 0
    @State private var offset: CGFloat = 600
    @State private var timeOffset = 0.3
    @State private var backgroundOpacity = 0.0

    var body: some View {
        ZStack {
            Color.Beige.edgesIgnoringSafeArea(.all)
            
            BackgroundView()
                .opacity(backgroundOpacity)

            VStack {
                Button(action: {
                    withAnimation(.easeInOut) {
                        buttonOffsetY = -offset
                        backgroundOpacity = 0.0
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        nextPage = true
                    }
                }) {
                    CustomButton(data: "GO", isCircle: true, color: Color.Medium, buttonOffsetY: buttonOffsetY, buttonOffsetX: 0)
                }
            }
            .onAppear {
                
              
             
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation(.easeInOut(duration: 1)) {
                        backgroundOpacity = 1.0 //
                    }
                }
               
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
