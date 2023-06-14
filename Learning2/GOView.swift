import SwiftUI
import Foundation

struct GOView: View {
    
   
    
    @State private var nextPage = false
    @State private var buttonOffsetY: CGFloat = 0
    @State private var offset: CGFloat = 500
    @State private var timeOffset = 0.3
    @State var background = BackgroundView()
    var body: some View {
        ZStack{
           background
            VStack {
                //>>>>>GO BUTTON>>>>>
                Button(action: { withAnimation(.easeInOut){
                        buttonOffsetY = -offset}
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + timeOffset) {
                        nextPage = true}}) {
                            
                    CustomButton(data:"GO",isCircle: true, color: Color.Medium ,buttonOffsetY: buttonOffsetY, buttonOffsetX: 0)
                                
                }
                // <<<<GO BUTTON <<<<<
            }.onAppear{
               let array = getArray()
                print(array)
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
