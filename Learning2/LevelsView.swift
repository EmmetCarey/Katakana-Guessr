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
    
    @State private var levelSelected: Int = 1
    
    @State private var questions : [[String]] = []
    
    let length = Info.buttonNamesKat.count
    
    let color = Color.Medium // Button color
    
    
    var body: some View {
        
        ZStack{
            
            Color.Beige.edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false){
   
                VStack {
                    Spacer()
                    .frame(height: 50)
                    
                    //>>> MENU >>>
                    Button(action: {
                        withAnimation(.easeInOut){
                            isBack = true
                            print(isBack)
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
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
                            }
                    
                    //<<< MENU <<<
                    
                    ForEach(0..<length) { index in
                        
                        Button(action: {
                            withAnimation(.easeInOut) {
                                levelSelected = index
                                updateQuestions(index: index)
                                isForward = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                                nextPage = true
                                
                            }
                        }){
                            
                            CustomButton(data:isKat ? Info.buttonNamesKat[index] : Info.buttonNamesHir[index], isCircle: false, color: color, buttonOffsetY: 40, buttonOffsetX: 0)
                            }
                        
                        
                            .disabled((isKat && index > levelProgressKat) || (!isKat && index > levelProgressHir))
                            .opacity((isKat && index > levelProgressKat) || (!isKat && index > levelProgressHir) ? 0.5 : 1.0)

                    }
                    
                   
                    //Button Loop
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
    
    func updateQuestions(index: Int) {
        
        switch (index, isKat) {
        case (0, false):
            questions = [Info.hir_vowels, Info.rom_vowels]
        case (1, false):
            questions = [Info.hir_k, Info.rom_k]
        case (2, false):
            questions = [Info.hir_s, Info.rom_s]
        case (3, false):
            questions = [Info.hir_t, Info.rom_t]
        case (4, false):
            questions = [Info.hir_n, Info.rom_n]
        case (5, false):
            questions = [Info.hir_h, Info.rom_h]
        case (6, false):
            questions = [Info.hir_m, Info.rom_m]
        case (7, false):
            questions = [Info.hir_r, Info.rom_r]
        case (0, true):
            questions = [Info.kat_vowels, Info.rom_vowels]
        case (1, true):
            questions = [Info.kat_k, Info.rom_k]
        case (2, true):
            questions = [Info.kat_s, Info.rom_s]
        case (3, true):
            questions = [Info.kat_t, Info.rom_t]
        case (4, true):
            questions = [Info.kat_n, Info.rom_n]
        case (5, true):
            questions = [Info.kat_h, Info.rom_h]
        case (6, true):
            questions = [Info.kat_m, Info.rom_m]
        case (7, true):
            questions = [Info.kat_r, Info.rom_r]
        default:
            questions = [Info.hir_vowels, Info.rom_vowels]
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
    

    
    
    struct LevelsView_Previews: PreviewProvider {
        static var previews: some View {
            LevelsView(isKat: .constant(true))
        }
    }
}
