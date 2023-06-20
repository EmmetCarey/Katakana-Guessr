//
//  LevelsView.swift
//  Learning2
//
//  Created by Emmet Carey on 12/06/2023.
//

import SwiftUI

struct LevelsView: View {
    
    @State private var nextPage : Bool = false
    @Binding var isKat : Bool
    @State private var isResetKat = false
    @State private var isResetHir = false
    @State private var isBack = false
    @State private var isForward = false
    @State private var level = 0
    @State private var levelProgressKat: Int = 1
    @State private var levelProgressHir: Int = 1
    @State private var buttonOffsetY: CGFloat = 40
    @State private var levelSelected: Int = 1
    @State private var questions : [[String]] = []
    
    let length = Info.katNEW1.count
    
    let color = Color.Medium // Button color
    
    
    var body: some View {
        
        ZStack{
            Color.Beige.edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false){
                VStack {
                    Spacer()
                    .frame(height: 50)
                    
                    menuButton()
                    
                    levelButtons()
                    
                }
                
                Spacer()
                .frame(height: 200)
                
                .fullScreenCover(isPresented: $nextPage){
                    if isForward{
                        QuestionView(currentLevel: levelSelected, isKat: isKat, questions: questions)
                    }
                    if isBack{
                        GOView()
                    }
                }
                
            }//ScrollView
            
            .onAppear{
                initializeLevelProgressKat(isReset:isResetKat)
                initializeLevelProgressHir(isReset:isResetHir)
                if isResetHir || isResetKat{
                    print("RESET IS ON RESET IS ON RESET IS ON RESET IS ON RESET IS ON RESET IS ON ")
                }
            }
                
            //ZStack
        }//var body: some View
    }//struct LevelsView: View

    
    func updateLevelProgress(index: Int){
        if isKat{
            if levelProgressKat == index
            {
                levelProgressKat = index+1
                UserDefaults.standard.set(levelProgressKat, forKey: "levelProgressKat")
                levelProgressKat = UserDefaults.standard.integer(forKey: "levelProgressKat")
            }
        }else{
            if levelProgressHir == index
            {
                levelProgressHir = index+1
                UserDefaults.standard.set(levelProgressHir, forKey: "levelProgressHir")
                levelProgressHir = UserDefaults.standard.integer(forKey: "levelProgressHir")
            }
        }
    }
    
    func initializeLevelProgressKat(isReset: Bool) {
            if isReset || UserDefaults.standard.object(forKey: "levelProgressKat") == nil {
                levelProgressKat = 0
                UserDefaults.standard.set(levelProgressKat, forKey: "levelProgressKat")
            } else {
                levelProgressKat = UserDefaults.standard.integer(forKey: "levelProgressKat")
               
            }
        }
    
    func initializeLevelProgressHir(isReset: Bool){
        
        if isReset || UserDefaults.standard.object(forKey: "levelProgressHir") == nil {
            levelProgressHir = 0
            UserDefaults.standard.set(levelProgressHir, forKey: "levelProgressHir")
        }else{
            levelProgressHir = UserDefaults.standard.integer(forKey: "levelProgressHir")
           
        }
        
        
    }
    
    func menuButton() -> some View{
        
        //>>> MENU >>>
        Button(action: {
            withAnimation(.easeInOut){
                isBack = true
                buttonOffsetY = -1100
                
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                nextPage=true
            }
            
        })  {
            Text("menu")
                .frame( width: 130,height: 50)
                .font(.system(size:30,weight:.bold))
                .foregroundColor(Color.white)
                .background(Color.Easy)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .offset(y: buttonOffsetY) // Apply the Y offset
                .offset(x: 0)
                }
        
        //<<< MENU <<<
    }
    
    func levelButtons() -> some View{
        ForEach(0..<length) { index in
            Button(action: {
                withAnimation(.easeInOut) {
                    levelSelected = index
                    questions = getQuestions(isKat: isKat, level: index)
                    isForward = true
                    buttonOffsetY = -1100
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                    nextPage = true
                    
                }
            }){
                
                CustomButton(data:isKat ? Info.katNEW1[index].joined() : Info.hirNEW1[index].joined(), isCircle: false, color: color, buttonOffsetY: buttonOffsetY, buttonOffsetX: 0)
                }
            
            
                .disabled((isKat && index > levelProgressKat) || (!isKat && index > levelProgressHir))
                .opacity((isKat && index > levelProgressKat) || (!isKat && index > levelProgressHir) ? 0.5 : 1.0)

        }
    }
    
    struct LevelsView_Previews: PreviewProvider {
        static var previews: some View {
            LevelsView(isKat: .constant(true))
        }
    }
}
