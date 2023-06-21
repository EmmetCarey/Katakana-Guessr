import SwiftUI

struct KatHirView2: View {
    
    @State private var nextPage = false
    @State private var isKat = false
    
    @State private var isBack = false
    @State private var isTest = false
    
    @State private var isMoveButtons = false
    @State private var hirPressed = false
    @State private var katPressed = false
    @State private var finalMove : CGFloat = 0
    @State private var buttonOffsetX: CGFloat = 0
    
    @State private var width: CGFloat = 150
    @State private var height: CGFloat = 50
    @State private var fontSize: CGFloat = 30
    @State private var color: Color = Color.Easy
    
    @State private var offset1: CGFloat = 400
    @State private var offset: CGFloat = 0
    
    @State private var left: CGFloat = -1
    @State private var right: CGFloat = 1
    @State private var up: CGFloat = -1
    @State private var down: CGFloat = 1
    
    @State private var katOffset: CGFloat = 0
    @State private var hirOffset: CGFloat = 0
    
    @State private var hirOffsetOnHir: CGFloat = -1
    @State private var hirOffsetOnKat: CGFloat = -1
    
    
    
    
    
    var body: some View {
        ZStack{
            
            Color.Beige.edgesIgnoringSafeArea(.all)
            
            
            VStack {
                Spacer().frame(height: 100)
                getKatakana(label: "Katakana",direction: right,isKat:true)
                getHiragana(label: "Hiragana",direction: left,isKat:false)
                getButton2(label: "Learn", test: false, kat: true,direction: left)
                getButton2(label: "Test", test: true, kat: true,direction: right)
                
                /*
                getButton2(label: "Learn", test: false, kat: false,direction: right)
                getButton2(label: "Test", test: true, kat: false,direction: left)
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
    
    func getKatakana(label: String, direction: CGFloat, isKat: Bool) -> some View{
        
        Button(action:{
            withAnimation(.easeInOut){
                katPressed = true
                isMoveButtons = true
            }
        }){
            Text(label)
                .frame(width:  260 , height: 70 )
                .font(.system(size: 40 , weight: .bold))
                .foregroundColor(Color.white)
                .background(Color.Medium)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                // 1:  2:is move and kat pressed = -20   3: 4:
                .offset(y: isMoveButtons ? (hirPressed ? -1000 : (katPressed ? 40 : 0)) : 0)
                .offset(x: finalMove*direction)
        }
        
    }

    func getHiragana(label: String, direction: CGFloat, isKat: Bool) -> some View{
        
        Button(action:{
        
            withAnimation(.easeInOut){
                hirPressed = true
                isMoveButtons = true
            }
        }){
            Text(label)
                .frame(width:  260 , height: 70 )
                .font(.system(size: 40 , weight: .bold))
                .foregroundColor(Color.white)
                .background(Color.Medium)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .offset(y: isMoveButtons ? (katPressed ? 1000 : (hirPressed ? -20 : 0)) : 0)
                .offset(x: finalMove)
        }
        
    }
    
    func getButton2(label: String, test: Bool, kat: Bool, direction: CGFloat) -> some View{
        
        Button(action:{
            withAnimation(.easeInOut(duration: 0.5)){
                moveButtons()
                isKat = kat
                isTest = test
                finalMove = 400
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
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
                .offset(x:(isMoveButtons) ? buttonOffsetX*direction : 400*direction)
     
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
    
    struct KatHirView2_Previews: PreviewProvider {
        static var previews: some View {
            KatHirView2()
        }
    }
  

