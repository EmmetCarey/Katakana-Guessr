import SwiftUI

struct KatHirView: View {
    
    @State private var nextPage = false
    @State private var isKat = false
    
    @State private var isBack = false
    @State private var isTest = false
    
    @State private var button1OffsetX: CGFloat = 0
    @State private var button2OffsetX: CGFloat = 0
    
    @State private var width: CGFloat = 150
    @State private var height: CGFloat = 50
    @State private var fontSize: CGFloat = 30
    @State private var color: Color = Color.Easy
    @State private var offset: CGFloat = 500
    @State private var timeOffset = 0.3
    
    
    var body: some View {
        ZStack{
            
            Color.Beige.edgesIgnoringSafeArea(.all)
            
            
            VStack {
                Spacer().frame(height: 50)
                menuButton()
                getLabel(label: "Katakana")
                katButton(label: "Learn", type: false)
                katButton(label: "Test", type: true)
                
                Spacer().frame(height: 50)
                getLabel(label: "Hiragana")
                hirButton(label: "Learn", type: true)
                hirButton(label: "Test", type: true)
                
            }
            .fullScreenCover(isPresented: $nextPage){
                if isTest{
                    if isKat{
                        LevelsView(isKat:.constant(true))
                    }
                    if !isKat{
                        LevelsView(isKat:.constant(false))
                    }
                }
                if !isTest && !isBack{
                    LearnView(isKat: $isKat)
                }else if isBack{
                    GOView()
                }
                
            }
        }
    }
    
    func getLabel(label: String) -> some View{
        Text(label)
            .frame(width:  200 , height: 50 )
            .font(.system(size: 30,weight:.bold))
            .foregroundColor(Color.white)
            .background(Color.Medium)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .offset(x:button2OffsetX)
    }
    
    func menuButton() -> some View{
        
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
                .offset(y: -100) // Apply the Y offset
                .offset(x: button2OffsetX)
            
        }
        //<<< MENU <<<
    }
    
    func katButton(label: String, type: Bool) -> some View{
        //>>>>>KAT BUTTON>>>
        Button(action: {
            withAnimation(.easeInOut){
                button1OffsetX = -offset
                button2OffsetX = offset
                isKat = true
                isTest = type
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + timeOffset) {
                nextPage=true
            }
            
        }) {
            Text(label)
                .frame(width:  width , height: height )
                .font(.system(size: fontSize , weight: .bold))
                .foregroundColor(Color.white)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .offset(x:button1OffsetX)
        }
        // <<<<KAT BUTTON <<<<<
    }
    
    func hirButton(label: String, type: Bool) -> some View{
        
        //>>>>>HIR BUTTON>>>>>
        Button(action: {
            withAnimation(.easeInOut){
                button1OffsetX = 500
                button2OffsetX = -500
                isKat = false
                isTest = type
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                nextPage=true
            }
            
        })  {
            Text(label)
                .frame(width:  width , height: height )
                .font(.system(size: fontSize , weight: .bold))
                .foregroundColor(Color.white)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .offset(x:button1OffsetX)
        }
        // <<<<HIR BUTTON <<<<<
        
        
    }
    
    struct KatHirView_Previews: PreviewProvider {
        static var previews: some View {
            KatHirView()
        }
    }
  
}
