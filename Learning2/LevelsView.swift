//
//  LevelsView.swift
//  Learning2
//
//  Created by Emmet Carey on 12/06/2023.
//

import SwiftUI

struct LevelsView: View {
    
    @Binding var isKat : Bool
    
    @State private var nextPage : Bool = false
    @State private var isResetKat = false
    @State private var isResetHir = false
    @State private var isBack = false
    @State private var isForward = false
    @State private var level = 1
    @State private var levelProgressKat: Int = 1
    @State private var levelProgressHir: Int = 1
    @State private var buttonOffsetY: CGFloat = 0
    @State private var levelSelected: Int = 1
    @State private var questions : [[String]] = []
    @State private var limit = 1
    @State private var backgroundOpacity = 0.2

    var body: some View {
        
        ZStack{
            
            Color.Beige.edgesIgnoringSafeArea(.all)

            ScrollView(showsIndicators: false){
                
                VStack {
                    
                    Spacer().frame(height: 50)
                    
                    if levelProgressKat>33{
                        Spacer().frame(height: 50)
                        menuButton()
                        Spacer().frame(height: 50)
                        infiniteButton(index: 33)
                    }else{
                        menuButton()
                    }
                }
                VStack {
                    
                    Spacer().frame(height: 50)

                    levelButtons(start: 0, end: 3, color: Color.Medium)
                    
                    testButton(index: 3, level: 3, name: "Test 1", color: Color.BlueEasy, levels: [0,1,2])
                    
                    levelButtons(start: 4, end: 7, color: Color.Medium)
                    
                    testButton(index: 7, level: 7, name: "Test 2", color: Color.BlueEasy, levels: [4,5,6])
                    
                    levelButtons(start: 8, end: 11, color: Color.Medium)
                    
                    testButton(index: 11, level: 11, name: "Test 3", color: Color.BlueEasy, levels: [8,9,10])
            
                    levelButtons(start: 12, end: 17, color: Color.Medium)
                    
                }
                VStack {
                    
                    testButton(index: 17, level: 17, name: "Test 4", color: Color.BlueEasy, levels: [12,13,14,15,16])
                    
                    levelButtons(start: 18, end: 21, color: Color.Medium)
                    
                    testButton(index: 21, level: 21, name: "Test 5", color: Color.BlueEasy, levels: [18,19,20])
                    
                    levelButtons(start: 22, end: 25, color: Color.Medium)
                    
                    testButton(index: 25, level: 25, name: "Test 6", color: Color.BlueEasy, levels: [22,23,24])
                    
                    levelButtons(start: 26, end: 29, color: Color.Medium)
                    
                    testButton(index: 29, level: 29, name: "Test 6", color: Color.BlueEasy, levels: [27,28,29])
                    
                    levelButtons(start: 30, end: 33, color: Color.Medium)
                    
                    testButton(index: 33, level: 33, name: "Test 6", color: Color.BlueEasy, levels: [31,32,33])
                     
                    Spacer().frame(height: 200)
                }
                
                .fullScreenCover(isPresented: $nextPage){
                    if isForward{
                        QuestionView(limit: limit, currentLevel: levelSelected, isKat: isKat, questions: questions)
                    }
                    if isBack{
                        GOView()
                    }
                }
                
            }
            .onAppear{
                initializeLevelProgress(isKat: isKat, isReset:isResetKat)
            }
                
            //ZStack
        }//var body: some View
    }//struct LevelsView: View

    func infiniteButton(index: Int) -> some View{
        Button(action: {
            withAnimation(.easeInOut) {
                
                levelSelected = index
                questions = getTest(isKat: isKat, levels: [0,1,2,4,5,6,8,9,10,12,13,14,15,16,18,19,20,22,23,24,26,27,28,30,31,32])
                isForward = true
                buttonOffsetY = -800
                limit = 100
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                nextPage = true
                
            }
        }){
            Text("FINAL LEVEL")
                .frame( width: 240,height: 60)
                .font(.system(size:30,weight:.bold))
                .foregroundColor(Color.Beige)
                .background(Color.Hard)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .offset(y: 0) // Apply the Y offset
                .offset(x: buttonOffsetY)
                }
            .disabled((isKat && index > levelProgressKat) || (!isKat && index > levelProgressHir))
            .opacity((isKat && index > levelProgressKat) || (!isKat && index > levelProgressHir) ? 0.5 : 1.0)
        
    }
    
    func testButton(index: Int, level: Int, name: String, color: Color, levels: [Int]) -> some View{
        
        Button(action: {
            withAnimation(.easeInOut) {
                
                levelSelected = index
                questions = getTest(isKat: isKat, levels: levels)
                isForward = true
                buttonOffsetY = 800
                limit = 30
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                nextPage = true
                
            }
        }){
            Text(name)
                .frame( width: 250,height: 70)
                .font(.system(size:30,weight:.bold))
                .foregroundColor(Color.white)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .offset(y: 0) // Apply the Y offset
                .offset(x: buttonOffsetY)
                }
            .disabled((isKat && index > levelProgressKat) || (!isKat && index > levelProgressHir))
            .opacity((isKat && index > levelProgressKat) || (!isKat && index > levelProgressHir) ? 0.5 : 1.0)
        
    }
    
    func levelButtons(start: Int, end: Int, color: Color) -> some View{
        
        ForEach(start..<end) { index in
            Button(action: {
                withAnimation(.easeInOut) {
                    limit = 15
                    levelSelected = index
                    questions = getQuestions(isKat: isKat, level: index)
                    isForward = true
                    buttonOffsetY = -800
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                    nextPage = true
                    
                }
            }){
                
                CustomButton(data:isKat ? Info.katNEW1[index].joined() : Info.hirNEW1[index].joined(), isCircle: false, color: color, buttonOffsetY: 0, buttonOffsetX: buttonOffsetY)
                }
            
            
                .disabled((isKat && index > levelProgressKat) || (!isKat && index > levelProgressHir))
                .opacity((isKat && index > levelProgressKat) || (!isKat && index > levelProgressHir) ? 0.5 : 1.0)

        }
    }
    
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
    
    func initializeLevelProgress(isKat: Bool, isReset: Bool) {
        if isKat{
            if isReset || UserDefaults.standard.object(forKey: "levelProgressKat") == nil {
                levelProgressKat = 0
                UserDefaults.standard.set(levelProgressKat, forKey: "levelProgressKat")
            } else {
                levelProgressKat = UserDefaults.standard.integer(forKey: "levelProgressKat")
                
            }
        }
        if !isKat{
            if isReset || UserDefaults.standard.object(forKey: "levelProgressHir") == nil {
                levelProgressHir = 0
                UserDefaults.standard.set(levelProgressHir, forKey: "levelProgressHir")
            }else{
                levelProgressHir = UserDefaults.standard.integer(forKey: "levelProgressHir")
               
            }
        }
    }
    
    func menuButton() -> some View{
        
        //>>> MENU >>>
        Button(action: {
            withAnimation(.easeInOut){
                isBack = true
                buttonOffsetY = -800
                
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
                .offset(y: 0) // Apply the Y offset
                .offset(x: buttonOffsetY)
                }
        
        //<<< MENU <<<
    }

    struct LevelsView_Previews: PreviewProvider {
        static var previews: some View {
            LevelsView(isKat: .constant(true))
        }
    }
}
