//
//  QuestionView.swift
//  Learning2
//
//  Created by Emmet Carey on 12/06/2023.
//

import SwiftUI
import AVFoundation

struct QuestionView: View {
    
    @State var audioPlayer: AVAudioPlayer?
    @State private var nextPage : Bool = false
    @State private var questionSymbol = ""
    @State private var answerRom = ""
    @State private var choiceArray: [String] = ["", "", "", ""]
    @State private var score = 0
    @State private var isBack = false
    @State private var progress: CGFloat = 1.0
    @State private var timer: Timer?
    @State private var timerOn: Bool = true
    @State var isTest: Bool
    @State var backgroundOpacity: CGFloat = 1
    let barHeight: CGFloat = 50.0
    let barWidth: CGFloat = 300.0
    let limit : Int
    var currentLevel : Int
    var isKat: Bool
    var questions: [[String]]
    @State var opacity: CGFloat = 1
    
    var body: some View {
        
        ZStack{
            Color.Beige.edgesIgnoringSafeArea(.all)
            VStack {
              
                
                showQuestion()
                showOptions()
                if limit < 999{
                    progressBar()
                }
               
                
                HStack{
                    if isTest{
                        Spacer().frame(width: 60)
                    }
                    menuButton()
                    Spacer().frame(width: 70)
                    if !isTest{
                        showTimer()
                    }
                   
                }
      
            }
            .opacity(backgroundOpacity)
            .fullScreenCover(isPresented: $nextPage){
                
                if !isBack{
                    if isKat{
                        LevelsView(isKat: .constant(true))
                        
                    }else{
                        LevelsView(isKat: .constant(false))
                    }
                }
                if isBack{
                    KatHirView()
                }
                
            }
        }//ZStack
        .onAppear{
            startTimer()
            generateRandoms()
            print(UserDefaults.standard.integer(forKey: "levelProgressKat"))
        }
    }//var body: some View
    
    
    
    
    func showOptions() -> some View{
        
        ForEach(0..<2) { row in
            HStack {
                ForEach(0..<2) { column in
                    let index = row * 2 + column
                    
                    Button(action: {
                       
                        checkAnswer(answer: choiceArray[index])
                    }) {
                        CustomButton(data: choiceArray[index], isCircle: true, color: Color.Medium, buttonOffsetY: 0, buttonOffsetX: 0).opacity(opacity)
                        
                    }
                }
            }
        }
    }
    
     func calculateProgressBarWidth() -> CGFloat {
           let maxWidth: CGFloat = 200 // Adjust this value as needed
           let percentage = CGFloat(score) / CGFloat(limit)
           return maxWidth * min(percentage, 1.0)
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
            
           
        }.opacity(opacity)
    }
    
    func showTimer() -> some View{
        Button(action: {
            if timerOn{
                playAudio(file: "down")
                timerOn=false
                progress = 0
            }else{
                playAudio(file: "correct")
                timerOn = true
                generateRandoms()
            }
           }) {
               Image(systemName: "clock.fill")
                   .resizable()
                   .foregroundColor(.white)
                   .frame(width: 30, height: 30)
                   .padding(10)
                   .background(Color.Easy)
                   .clipShape(Circle())
                   .opacity(nextPage ? opacity : (timerOn ? 1 : 0.5))
                   .offset(y:40)
                   .opacity(opacity)
                   
           }
           .padding(10)
    }
    func showQuestion() -> some View{

        
        RoundedRectangle(cornerRadius: 10)
            .fill(.red)
            .frame(width: currentLevel > 14 ? 170 : 130, height: 130)
            .opacity(0.5)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.red)
                    .frame(width: currentLevel > 14 ? 170 : 130, height: progress*130)
                    .offset(y: 65 * (1-progress))
                    .overlay(
                    Text(questionSymbol)
                        .font(.system(size: 80,weight:.bold))
                        .foregroundColor(Color.white)
            )
                )
            .opacity(opacity)
    }
    func playAudio(file : String) {
            guard let audioFileURL = Bundle.main.url(forResource: file, withExtension: "mp3") else {
                return
            }
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: audioFileURL)
                audioPlayer?.play()
            } catch {
                print("Error playing audio: \(error.localizedDescription)")
            }
        }
 
    
    func menuButton() -> some View{
        
        Button(action: {
            playAudio(file: "down")
            withAnimation(.easeInOut){
                timerOn = false
                isBack = true
                goNextPage()
            }
        })  {
            ZStack {
                Circle()
                    .fill(Color.Easy)
                    .frame(width: 50, height: 50)
                Image(systemName: "chevron.left")
                    .font(.system(size:30,weight:.bold))
                    .foregroundColor(.white)
          
            }
            .offset(y:40)
            .opacity(opacity)
            
        }
    }


    func checkAnswer(answer: String){
        
        if answer == answerRom{
            playAudio(file: answer)
            score+=1
            generateRandoms()
            changeJSON(searchString: answerRom, isPlus: true)
            
        }else{
            playAudio(file: "incorrect")
            score=0
            changeJSON(searchString: answerRom, isPlus: false)
        }
        
        if score == limit && isKat && currentLevel == UserDefaults.standard.integer(forKey: "levelProgressKat"){
            var levelProgressKat = UserDefaults.standard.integer(forKey: "levelProgressKat")
            levelProgressKat+=1
            UserDefaults.standard.set(levelProgressKat, forKey: "levelProgressKat")
            questionSymbol = ""
            choiceArray = ["", "", "", ""]
            timerOn = false
            goNextPage()
            
        }
        else if score == limit && !isKat && currentLevel == UserDefaults.standard.integer(forKey: "levelProgressHir"){
            var levelProgressHir = UserDefaults.standard.integer(forKey: "levelProgressHir")
            levelProgressHir+=1
            UserDefaults.standard.set(levelProgressHir, forKey: "levelProgressHir")
            questionSymbol = ""
            choiceArray = ["", "", "", ""]
            timerOn = false
            goNextPage()
        }
       else if score == limit && currentLevel != UserDefaults.standard.integer(forKey: "levelProgressHir") || score == limit && currentLevel != UserDefaults.standard.integer(forKey: "levelProgressKat"){
           questionSymbol = ""
           choiceArray = ["", "", "", ""]
           timerOn = false
           goNextPage()
        }
        
    }
    
    func startTimer() {
        if timerOn{
            timer?.invalidate() // Stop the timer if it's already running
            if answerRom != ""{
                playAudio(file: answerRom)
            }
            timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                if progress > 0.0{
                    progress -= 0.1 / 10.0 // Adjust the decrement value to control the speed of progress
                } else {
                   
                    progress = 1.0 // Reset progress to 1.0 when it reaches 0.0
                    generateRandoms()
                    if score > 0{
                        score-=1
                    }
                    
                }
            }
        }
    }
    
    func resetProgress() {
        timer?.invalidate() // Stop the timer
        progress = 1.0 // Reset progress to 1.0
        startTimer() // Start the timer again
    }
    
    func goNextPage(){
        withAnimation(.easeInOut){
            opacity = 0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
            nextPage = true
            
        }
    }
    
    func generateRandoms(){
        resetProgress()
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
        QuestionView(isTest: false, limit: 3, currentLevel: 3, isKat: true, questions: [Info.katNEW1[1],Info.romNEW1[1]])
    }
}
