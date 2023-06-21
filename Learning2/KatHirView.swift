import SwiftUI

struct KatHirView: View {
    
    @State private var nextPage = false
    @State private var isKat = false
    
    @State private var isBack = false
    @State private var isTest = false
    
    @State private var buttonOffsetX: CGFloat = 0
    
    @State private var width: CGFloat = 150
    @State private var height: CGFloat = 50
    @State private var fontSize: CGFloat = 30
    @State private var color: Color = Color.Easy
    @State private var offset: CGFloat = 500
    @State private var timeOffset = 0.3
    
    @State private var left: CGFloat = -1
    @State private var right: CGFloat = 1
    
    
    
    var body: some View {
        ZStack{
            
            Color.Beige.edgesIgnoringSafeArea(.all)
            
            
            VStack {
                
                getLabel2(label: "Katakana",direction: right)
                getButton2(label: "Learn", test: false, kat: true,direction: left)
                getButton2(label: "Test", test: true, kat: true,direction: right)
                
                getLabel2(label: "Hiragana",direction: left)
                getButton2(label: "Learn", test: false, kat: false,direction: right)
                getButton2(label: "Test", test: true, kat: false,direction: left)
                
                
                /*
                Spacer().frame(height: 50)
                getLabel(label: "Katakana")
                Spacer().frame(height: 50)
                katButton(label: "Learn", type: false)
                katButton(label: "Test", type: true)
                
                Spacer().frame(height: 50)
                getLabel(label: "Hiragana")
                Spacer().frame(height: 50)
                hirButton(label: "Learn", type: false)
                hirButton(label: "Test", type: true)
                */
            }
                
                
                
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
    
    func moveButtons(){
        buttonOffsetX = 400
    }
    
    func getLabel2(label: String, direction: CGFloat) -> some View{
        
        Text(label)
            .frame(width:  200 , height: 50 )
            .font(.system(size: 30,weight:.bold))
            .foregroundColor(Color.white)
            .background(Color.Medium)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .offset(x:buttonOffsetX*direction)
        
        
        
    }
    
    func getButton2(label: String, test: Bool, kat: Bool, direction: CGFloat) -> some View{
        
        Button(action:{
            withAnimation(.easeInOut(duration: 0.5)){
                moveButtons()
                isKat = kat
                isTest = test
                DispatchQueue.main.asyncAfter(deadline: .now() + timeOffset) {
                    nextPage=true
                }
            }
        }){
            Text(label)
                .frame(width:  width , height: height )
                .font(.system(size: fontSize , weight: .bold))
                .foregroundColor(Color.white)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .offset(x:buttonOffsetX*direction)
            
        }
        
    }
    /*
    func getLabel(label: String) -> some View{
        Text(label)
            .frame(width:  200 , height: 50 )
            .font(.system(size: 30,weight:.bold))
            .foregroundColor(Color.white)
            .background(Color.Medium)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .offset(x:buttonOffsetX)
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
        
        */
    }
    
    struct KatHirView_Previews: PreviewProvider {
        static var previews: some View {
            KatHirView()
        }
    }
  

