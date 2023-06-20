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
    @State private var isBack = false
    
    let limit : Int
    var currentLevel : Int
    var isKat: Bool
    var questions: [[String]]
    
    
    var body: some View {
        
        ZStack{
            Color.Beige.edgesIgnoringSafeArea(.all)
            VStack {
                
                showQuestion()
                showOptions()
                progressBar()
                menuButton()
                
            }.fullScreenCover(isPresented: $nextPage){
                
                if !isBack{
                    if isKat{
                        LevelsView(isKat: .constant(true))
                    }else{
                        LevelsView(isKat: .constant(false))
                    }
                }
                if isBack{
                    GOView()
                }
            }
        }//ZStack
        .onAppear{
            print(currentLevel,"DFGHJHGFDFGH")
            print(questions)
            print(questionSymbol,"HIII")
            print(answerRom,"<==")
            generateRandoms()
            print(UserDefaults.standard.integer(forKey: "levelProgressKat"))
        }
    }//var body: some View
    
    
    private func calculateProgressBarWidth() -> CGFloat {
           let maxWidth: CGFloat = 200 // Adjust this value as needed
           let percentage = CGFloat(score) / CGFloat(limit)
           return maxWidth * min(percentage, 1.0)
       }
    
    func showOptions() -> some View{
        
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
    }
    
    func progressBar() -> some View{
        
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 200, height: 20)
                .foregroundColor(.Easy)
                .opacity(0.1)
                .alignmentGuide(.leading) { d in d[.leading] }
                .alignmentGuide(.trailing) { _ in calculateProgressBarWidth() }
                .offset(y: 30)
            
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: calculateProgressBarWidth(), height: 20)
                .foregroundColor(.Medium)
                .animation(.easeInOut)
            
           
        }
    }
    
    func showQuestion() -> some View{
        
        Text("\(questionSymbol)")
            .font(.system(size: 80, weight: .bold))
            .offset(y: 0)
            .foregroundColor(.white)
            .frame(width: currentLevel > 14 ? 170 : 130, height: 130)
            .background(Color.Medium)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
    func menuButton() -> some View{
        
        //>>> MENU >>>
        Button(action: {
            withAnimation(.easeInOut){
                isBack = true
                nextPage=true
            }
            
        })  {
            Text("menu")
                .frame( width: 130,height: 50)
                .font(.system(size:30,weight:.bold))
                .foregroundColor(Color.white)
                .background(Color.Easy)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .offset(y: 40) // Apply the Y offset
                .offset(x:0)
        }
        //<<< MENU <<<
    }
    
    func checkAnswer(answer: String){
        
        if answer == answerRom{
            score+=1
            
            generateRandoms()
        }else{
            score=0
        }
        
        if score == limit && isKat && currentLevel == UserDefaults.standard.integer(forKey: "levelProgressKat"){
            var levelProgressKat = UserDefaults.standard.integer(forKey: "levelProgressKat")
            levelProgressKat+=1
            UserDefaults.standard.set(levelProgressKat, forKey: "levelProgressKat")
            questionSymbol = ""
            choiceArray = ["", "", "", ""]
            goNextPage()
            
        }
        else if score == limit && !isKat && currentLevel == UserDefaults.standard.integer(forKey: "levelProgressHir"){
            var levelProgressHir = UserDefaults.standard.integer(forKey: "levelProgressHir")
            levelProgressHir+=1
            UserDefaults.standard.set(levelProgressHir, forKey: "levelProgressHir")
            questionSymbol = ""
            choiceArray = ["", "", "", ""]
            goNextPage()
        }
       else if score == limit && currentLevel != UserDefaults.standard.integer(forKey: "levelProgressHir") || score == limit && currentLevel != UserDefaults.standard.integer(forKey: "levelProgressKat"){
           questionSymbol = ""
           choiceArray = ["", "", "", ""]
           goNextPage()
        }
        
    }
    
    func goNextPage(){
            nextPage = true
    }
    
    func generateRandoms(){
        
        let randomIndices = questions[0].indices.shuffled().prefix(4)
        
        let resultArray = randomIndices.map { index in
            guard index < questions[1].count else {
                fatalError("Index out of range for allRoms array: \(index)")
            }
            return questions[1][index]
        }
    
        answerRom = resultArray.randomElement() ?? ""
        print(answerRom)
        if let index = questions[1].firstIndex(of: answerRom) {
            questionSymbol = questions[0][index]
        } else {
            questionSymbol = ""
        }
       
        choiceArray = resultArray
        print(choiceArray,"dfghjkhgf")
        
        
    }
}//struct QuestionView: View

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(limit: 3, currentLevel: 3, isKat: true, questions: [Info.katNEW1[1],Info.romNEW1[1]])
    }
}
