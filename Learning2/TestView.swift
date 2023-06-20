//
//  TestView.swift
//  Learning2
//
//  Created by Emmet Carey on 19/06/2023.
//

import SwiftUI

struct TestView: View {
    
    
    
    @State private var nextPage : Bool = false
    
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
    
    var body: some View {
        
        
        
        let length = Info2.kat.count
        
        ZStack{
            
            Color.Beige.edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false){
                
                VStack {
                    Spacer()
                        .frame(height: 50)
                    
                    
                    ForEach(0..<9) { index in
                        
                        Button(action: {
                            questions = [Info2.kat[index],Info2.rom[index]]
                            print(questions)
                            withAnimation(.easeInOut) {
                                levelSelected = index
                                
                                nextPage = true
                     
                            }
                        })
                        {
                            CustomButton(data: Info2.kat[index].joined(), isCircle: false, color: Color.Easy, buttonOffsetY: 0, buttonOffsetX: 0)
                        }
                        
                    }
                    
                    
                    Spacer()
                        .frame(height: 50)
                    ForEach(9..<14) { index in
                        
                        Button(action: {
                            withAnimation(.easeInOut) {
                            }
                        })
                        {
                            CustomButton(data: Info2.kat[index].joined(), isCircle: false, color: Color.Medium, buttonOffsetY: 0, buttonOffsetX: 0)
                        }
                        
                    }
                    
                    Spacer()
                        .frame(height: 50)
                    ForEach(14..<length) { index in
                        
                        Button(action: {
                            withAnimation(.easeInOut) {
                            }
                        })
                        {
                            CustomButton(data: Info2.kat[index].joined(), isCircle: false, color: Color.Hard, buttonOffsetY: 0, buttonOffsetX: 0)
                        }
                        
                    }
                }
                
                .fullScreenCover(isPresented: $nextPage){
                    
                    QuestionView(currentLevel: levelSelected, isKat: true, questions: questions)
                }
            }
        }
    }
        

        
    }
    
    struct TestView_Previews: PreviewProvider {
        static var previews: some View {
            TestView()
        }
    }

