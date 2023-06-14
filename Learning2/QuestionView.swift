//
//  QuestionView.swift
//  Learning2
//
//  Created by Emmet Carey on 12/06/2023.
//

import SwiftUI

struct QuestionView: View {
    @State private var nextPage : Bool = false
    @State private var questionSymbol = ""
    @State private var answerRom = ""
    @State private var choiceArray: [String] = ["", "", "", ""]
    @State private var score = 0
    
    var currentLevel : Int
    var isKat: Bool
    var questions: [[String]]
    
    var body: some View {
        ZStack{
            Color.Beige.edgesIgnoringSafeArea(.all)
            VStack {
                
                Text("\(questionSymbol)")
                    .font(.system(size: 80, weight: .bold))
                    .offset(y: 0)
                    .foregroundColor(.white)
                    .frame( width: 130,height: 130)
                    .background(Color.Medium)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                ForEach(0..<2) { row in
                    HStack {
                        ForEach(0..<2) { column in
                            let index = row * 2 + column
                            
                            Button(action: {
                                checkAnswer(answer: choiceArray[index])
                            }) {
                                CustomButton(data: choiceArray[index], isCircle: true, color: Color.Medium, buttonOffsetY: 0, buttonOffsetX: 0)
                            }
                        }
                    }
                }
            }.fullScreenCover(isPresented: $nextPage){
                if isKat{
                    LevelsView(isKat: .constant(true))
                }else{
                    LevelsView(isKat: .constant(false))
                }
                
            }

            
            Text("\(score) / 10")
                .font(.system(size: 40, weight: .bold))
                .offset(y: 0)
                .foregroundColor(.white)
                .frame( width: 130,height: 60)
                .background(Color.Easy)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .offset(y: 280)
        }//ZStack
        .onAppear{
            generateRandoms()
            print(currentLevel)
            print(UserDefaults.standard.integer(forKey: "levelProgressKat"))
        }
    }//var body: some View
    
    func checkAnswer(answer: String){
        
        if answer == answerRom{
            score+=1
            generateRandoms()
        }else{
            score=0
        }
        
        if score == 10 && isKat && currentLevel == UserDefaults.standard.integer(forKey: "levelProgressKat"){
            var levelProgressKat = UserDefaults.standard.integer(forKey: "levelProgressKat")
            levelProgressKat+=1
            UserDefaults.standard.set(levelProgressKat, forKey: "levelProgressKat")
 
            nextPage=true
        }
        if score == 10 && !isKat && currentLevel == UserDefaults.standard.integer(forKey: "levelProgressHir"){
            var levelProgressHir = UserDefaults.standard.integer(forKey: "levelProgressHir")
            levelProgressHir+=1
            UserDefaults.standard.set(levelProgressHir, forKey: "levelProgressHir")

            nextPage=true
        }
        if score == 10 && currentLevel != UserDefaults.standard.integer(forKey: "levelProgressHir") || score == 10 && currentLevel != UserDefaults.standard.integer(forKey: "levelProgressKat"){
            nextPage = true
        }
    }
    
    func generateRandoms(){
        
        print(questions[0])
        print(questions[1])
        let randomIndices = questions[0].indices.shuffled().prefix(4)
        print(randomIndices)
        let resultArray = randomIndices.map { index in
            guard index < questions[1].count else {
                fatalError("Index out of range for allRoms array: \(index)")
            }
            return questions[1][index]
        }
    
        answerRom = resultArray.randomElement() ?? ""
        
        if let index = questions[1].firstIndex(of: answerRom) {
            questionSymbol = questions[0][index]
        } else {
            questionSymbol = ""
        }
        
        choiceArray = resultArray
        print(choiceArray)
        
        
    }
}//struct QuestionView: View

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(currentLevel: 1, isKat: true, questions: [Info.kat_vowels,Info.rom_vowels])
    }
}
