import SwiftUI

struct KatHirView: View {
    
    @State private var nextPage = false
    @State private var isKat = false
    
    @State private var isBack = false
    @State private var isForward = false
    
    @State private var button1OffsetX: CGFloat = 0
    @State private var button2OffsetX: CGFloat = 0
    @State private var offset: CGFloat = 500
    @State private var timeOffset = 0.3
    
    
    var body: some View {
        ZStack{
            Color.Beige.edgesIgnoringSafeArea(.all)
            VStack {
                //>>> MENU >>>
                Button(action: {
                    withAnimation(.easeInOut){
                        button1OffsetX = -offset
                        button2OffsetX = offset
                        isBack = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + timeOffset) {
                        nextPage=true
                    }
                    
                })  {
                    Text("menu")
                        .frame( width: 130,height: 50)
                        .font(.system(size:30,weight:.bold))
                        .foregroundColor(Color.white)
                        .background(Color.Easy)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .offset(y: -10) // Apply the Y offset
                        .offset(x: button2OffsetX)
                    
                }
                //<<< MENU <<<
                
                //>>>>>KAT BUTTON>>>
                Button(action: {
                    withAnimation(.easeInOut){
                        button1OffsetX = -offset
                        button2OffsetX = offset
                        isKat = true
                        isForward = true
                        print(isKat)
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + timeOffset) {
                        nextPage=true
                    }
                    
                }) {
                    CustomButton(data:"Katakana",
                                 isCircle: false,
                                 color: Color.Medium,
                                 buttonOffsetY: 0,
                                 buttonOffsetX: button1OffsetX)}
                // <<<<KAT BUTTON <<<<<
                
                //>>>>>HIR BUTTON>>>>>
                Button(action: {
                    withAnimation(.easeInOut){
                        button1OffsetX = -500
                        button2OffsetX = 500
                        isKat = false
                        isForward = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        nextPage=true
                    }
                    
                }) {
                    CustomButton(data:"Hiragana",
                                 isCircle: false,
                                 color: Color.Medium,
                                 buttonOffsetY: 0,
                                 buttonOffsetX: button2OffsetX)}
                // <<<<HIR BUTTON <<<<<
                
                
            }.zIndex(1)
            
            
            
                .fullScreenCover(isPresented: $nextPage){
                    if isForward{
                        if isKat{
                            LevelsView(isKat:.constant(true))
                        }
                        if !isKat{
                            LevelsView(isKat:.constant(false))
                        }
                        
                        
                    }else if isBack{
                        GOView()
                    }else{
                        KatHirView()
                    }
                }
        }
    }
    struct KatHirView_Previews: PreviewProvider {
        static var previews: some View {
            KatHirView()
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
