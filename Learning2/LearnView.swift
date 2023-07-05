//
//  LearnView.swift
//  Learning2
//
//  Created by Emmet Carey on 20/06/2023.
//

import SwiftUI
import UIKit
struct LearnView: View {
    
    @Binding var isKat: Bool
    
    @State private var isRom: [[Bool]] = Array(repeating: Array(repeating: false, count: Info.katList.count), count: Info.katList.count)
    
    @State private var nextPage : Bool = false
    @State private var show : Bool = true
    @State private var isShowing : Bool = true
    @State private var opacity : CGFloat = 1
    @State private var offsetY : CGFloat = 0
    @State private var showButtonVisible : Bool = true
    @State private var width: CGFloat = 80
    
    var body: some View {
        ZStack{
            
            Color.Beige.edgesIgnoringSafeArea(.all)
           
            ScrollView(showsIndicators: false){
               
                VStack{
                    Spacer().frame(height: 40)
                    HStack{
                        menuButton()
                        Spacer().frame(width: 30)
                        getTitle(label: "Monographs")
                        Spacer().frame(width: 30)
                        showButton()
                    }
                }
                VStack {
                    Spacer().frame(width: 20)
                    createRow(start: 0, end: 6, big: false)
                    Spacer().frame(height: 100)
                    getTitle(label: "Diacritics")
                    createRow(start: 10, end: 14, big : false)
                    Spacer().frame(height: 100)
                   
                    
                }
                VStack{
                    
                    getTitle(label: "Diagraphs")
                    createRow(start: 14, end: 17, big : true)
                    Spacer().frame(height: 20)
                    createRow(start: 17, end: 20, big : true)
                    Spacer().frame(height: 20)
                    createRow(start: 20, end: 23, big : true)
                     
                    
                }
                .onAppear(){
                    print(isKat)
                }
                .frame(maxWidth: .infinity)
                .fullScreenCover(isPresented: $nextPage){
                    KatHirView()
                }
                VStack{
                    Spacer().frame(height: 50)
                   // createRow(start: 23, end: 27, big : true)
                }
                .frame(maxWidth: .infinity)
            }
            
        }
    }
    
    func createRow(start: Int, end: Int, big: Bool) -> some View {
        ForEach(start..<end) { x in
            Spacer().frame(height: show ? 60 : 20)
            HStack {
                ForEach(0..<Info.katList[x].count) { y in
                    createButton(labelKat: isKat ? Info.katList[x][y] : Info.hirList[x][y], labelRom: Info.romList[x][y], x: x, y: y, big: big)
                }
            }
        }
    }
    
    func getTitle(label: String) -> some View{
        
        Text(label)
            .font(.system(size: 30,weight:.bold))
            .foregroundColor(Color.black)
            .opacity(opacity)
        
    }
    
    func createButton(labelKat: String, labelRom: String, x: Int, y: Int ,big: Bool) -> some View {
        ZStack{
            /*
            Button(action: {
                
                isRom[x][y].toggle()
                withAnimation(.easeInOut) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        isRom[x][y].toggle()
                    }
                }
            }) {
                Text(labelKat)
                    .frame(width: !big ? 60 : 80, height: 60)
                    .font(.system(size: !big ? 35: 35, weight: .bold))
                    .foregroundColor(Color.white)
                    .background(Color.Easy)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .opacity(1.0)
                
            }.buttonStyle(PlainButtonStyle())
            */
             Text(labelRom)
                 .font(.system(size: !big ? 35: 35, weight: .bold))
                 .foregroundColor(Color.Blackish)
                 .offset(y: show ? 60 : 0)
                 .opacity( opacity)
            
            Text(labelKat)
                .frame(width: !big ? 65 : 80, height: 70)
                .font(.system(size: !big ? 35: 35, weight: .bold))
                .foregroundColor(Color.Blackish)
                .background(Color.Beigeish)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .opacity( opacity)
               
                
        }
    }
    
    func showButton() -> some View{
        
        Button(action: {
            withAnimation(.easeInOut){
                show.toggle()
            }
        }) {
            ZStack{
                Circle()
                    .fill(Color.Easy)
                    .frame(width: 40, height: 40)
                    .opacity(opacity)
                Image(systemName: show ? "eye" : "eye.fill")
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.white)
                    .opacity(opacity)
                    
            }
           
                
        }
    }
    
    func menuButton() -> some View{
        
        Button(action: {
            
            showButtonVisible = false
            offsetY = -200
            
            withAnimation(.easeInOut(duration: 0.2)){
                opacity = 0
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    nextPage = true
                }
            }
        })  {
            ZStack {
                Circle()
                    .fill(Color.Easy)
                    .frame(width: 40, height: 40)
                    .opacity(opacity)
                Image(systemName: "chevron.left")
                    .font(.system(size:20,weight:.bold))
                    .foregroundColor(.white)
                    .opacity(opacity)
            }
        }
    }
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView(isKat: .constant(false))
    }
}


