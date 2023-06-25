import SwiftUI

struct KatHirView: View {
    
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
    
    @State private var offset: CGFloat = 0
    
    @State private var left: CGFloat = -1
    @State private var right: CGFloat = 1
    @State private var up: CGFloat = -1
    @State private var down: CGFloat = 1
    
    @State private var katOffset: CGFloat = 0
    @State private var hirOffset: CGFloat = 0
    
    @State private var hirOffsetOnHir: CGFloat = -1
    @State private var hirOffsetOnKat: CGFloat = -1
    
    @State private var backgroundOpacity = 0.0
    
    
    
    
    
    var body: some View {
        ZStack{
            
            Color.Beige.edgesIgnoringSafeArea(.all)
            BackgroundView()
                .opacity(backgroundOpacity)
            VStack {
               
                getButton(label: "Katakana", direction: right, isKat: true)
                getButton(label: "Hiragana", direction: left, isKat: false)
                getButton2(label: "Learn", test: false, kat: true,direction: left)
                getButton2(label: "Test", test: true, kat: true,direction: right)
            
            }
                
                
                
        }.onAppear(){
            changeOpacity(change: 0.5)
        }
            .fullScreenCover(isPresented: $nextPage){
                if isTest{
                    if isKat{LevelsView(isKat:.constant(true))}
                    if !isKat{LevelsView(isKat:.constant(false))}
                }
                if !isTest && !isBack{LearnView(isKat: $isKat)
                }else if isBack{KatHirView()}
                
            }
        
    }
    
    func changeOpacity(change : CGFloat){
        withAnimation(.easeInOut(duration: 0.3)) {
            backgroundOpacity = change //
        }
    }
    
    func getButton(label: String, direction: CGFloat, isKat: Bool) -> some View {
        Button(action: {
            changeOpacity(change: 0.2)
            withAnimation(.easeInOut) {
                if isKat {
                    katPressed = true
                    isMoveButtons = true
                } else {
                    hirPressed = true
                    isMoveButtons = true
                }
            }
        }) {
            Text(label)
                .frame(width: 260, height: 70)
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(Color.white)
                .background(Color.Medium)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .offset(x: finalMove)
                .offset(y: isMoveButtons ? getOffset(isKat: isKat) : 0)
        }
        .disabled(isMoveButtons)
    }

    func getOffset(isKat: Bool) -> CGFloat {
        if isKat {
            return hirPressed ? -1000 : (katPressed ? 70 : 0)
        } else {
            return katPressed ? 1000 : (hirPressed ? -10 : 0)
        }
    }


    func moveButtons(){
        buttonOffsetX = 400
    }

    
    func getButton2(label: String, test: Bool, kat: Bool, direction: CGFloat) -> some View{
        
        Button(action:{
            changeOpacity(change: 0)
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
    }
    
    struct KatHirView_Previews: PreviewProvider {
        static var previews: some View {
            KatHirView()
        }
    }
  

