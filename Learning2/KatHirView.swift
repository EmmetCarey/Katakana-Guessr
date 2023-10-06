import SwiftUI

struct KatHirView: View {
    @State private var scaleKatakana: CGFloat = 1.0
    @State private var scaleHiragana: CGFloat = 1.0
    
    @State private var nextPage = false
    @State private var isKat = false
    @State private var infiniteTest = false
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
    
    @State private var correct = "correct"
    
    @State private var color: Color = Color.Easy

    var body: some View {

            ZStack {
                
                Color.Beige.edgesIgnoringSafeArea(.all)
                BackgroundView().opacity(backgroundOpacity)
                
                VStack{
                    
                    KatakanaButton()
                    Spacer().frame(height: 5)
                    HiraganaButton()
                    
                    Spacer().frame(height: 50)
                    
                    getButton2(label: "Levels", test: true, direction: left)
                    getButton2(label: "Table", test: false, direction: right)
                    getButton3(label: "Test All", test: true, direction: left)
                }    
            }.onAppear(){
               
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){ //after 0.3 seconds
                    withAnimation(.easeInOut(duration: 1)) {           //for duration 1 second
                        backgroundOpacity = 0.8                        //change background letter opacity
                    }
                }
            }
                .fullScreenCover(isPresented: $nextPage){
                    
                    if infiniteTest {
                        
                        QuestionView(isTest: true, limit: 1000, currentLevel: 33, isKat: isKat, questions: getTest(isKat: isKat, levels: (0...UserDefaults.standard.integer(forKey: "levelProgressKat")).map { $0 }))
                        
                    } else if isTest {
                        
                        LevelsView(isKat: .constant(isKat))
                    } else {
                        
                        LearnView(isKat: $isKat)
                    }
                }
            
        
    }
    
    func KatakanaButton() -> some View{
        
        Button(action: {
            playAudio(file: correct)
            isKat = true
            withAnimation(.easeInOut){
                
                katPressed = true
                hirPressed = false
                isMoveButtons = true
                
                if scaleHiragana == 0.5 {
                    scaleHiragana = 1.0
                    scaleKatakana = 0.5
                } else {
                    scaleKatakana = 1.0
                    scaleHiragana = 0.5
                }
            }
        }) {
            Text("Katakana ア")
                .frame(width: 260, height: 70)
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(Color.white)
                .background(Color.Medium)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .scaleEffect(scaleKatakana)
                .offset(x: finalMove)
                .opacity(katPressed ? 1 : (hirPressed ? 0.5 : 1))
        }
        .disabled(scaleHiragana == 0.5)
        .offset(y: hirPressed ? 0: (katPressed ? 95 : 100))
    }
    
    func HiraganaButton() -> some View{
        Button(action: {
            
            playAudio(file: correct)
            isKat = false
            
            withAnimation(.easeInOut){
                katPressed = false
                hirPressed = true
                isMoveButtons = true
                if scaleKatakana == 1.0 {
                    scaleKatakana = 0.5
                    scaleHiragana = 1.0
                } else {
                    scaleHiragana = 0.5
                    scaleKatakana = 1.0
                }
            }

        }) {
            Text("Hiragana あ")
                .frame(width: 260, height: 70)
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(Color.white)
                .background(Color.Medium)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .scaleEffect(scaleHiragana)
                .offset(x: finalMove)
                .opacity(hirPressed ? 1 : (katPressed ? 0.5 : 1))
        }
        .disabled(scaleKatakana == 0.5)
        .offset(y: katPressed ? -75: (hirPressed ? 0 : 100))
    }
    
    func getButton2(label: String, test: Bool, direction: CGFloat) -> some View{
        
        Button(action:{
            playAudio(file: correct)
            changeOpacity(change: 0)
            
            withAnimation(.easeInOut(duration: 0.5)){
                moveButtons()
                isTest = test
                finalMove = 600
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
                .clipShape(RoundedRectangle(cornerRadius: 17))
                .offset(x:(isMoveButtons) ? buttonOffsetX*direction : 400*direction)
     
        }.disabled(!isMoveButtons)
        
    }
    
    func getButton3(label: String, test: Bool, direction: CGFloat) -> some View{
        
        Button(action:{
            playAudio(file: correct)
            changeOpacity(change: 0)
            withAnimation(.easeInOut(duration: 0.5)){
                moveButtons()
                infiniteTest = true
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
                .clipShape(RoundedRectangle(cornerRadius: 17))
               
                .offset(x:(isMoveButtons) ? buttonOffsetX*direction : 400*direction)
     
        }
        
    }
    
    func playAudio(file: String){
        AudioPlayer.playAudio(file: file)
    }
    
    func changeOpacity(change : CGFloat){
        
        withAnimation(.easeInOut(duration: 0.3)) {
            backgroundOpacity = change //
        }
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
    
}

struct KatHirView_Previews: PreviewProvider {
    static var previews: some View {
        KatHirView()
    }
}
