//
//  LearnView.swift
//  Learning2
//
//  Created by Emmet Carey on 20/06/2023.
//

import SwiftUI
struct LearnView: View {
    
    @Binding var isKat: Bool
    
    @State private var isRom: [[Bool]] = Array(repeating: Array(repeating: false, count: Info.katList.count), count: Info.katList.count)
    
    @State private var nextPage : Bool = false
    @State private var isShowing : Bool = true
    @State private var opacity : CGFloat = 1
    @State private var offsetY : CGFloat = 0
    
    @State private var width: CGFloat = 80
    
    var body: some View {
        ZStack{
            
            Color.Beige.edgesIgnoringSafeArea(.all)
           
           
            
            ScrollView(showsIndicators: false){
               
                VStack{
                    Spacer().frame(height: 50)
                    menuButton()
                    Spacer().frame(height: 60)
                    getLabel2(label: "Monographs")
                }
                VStack {
                    /*
                    createRow(start: 0, end: 6, big: false)
                    Spacer().frame(height: 100)
                    getLabel2(label: "Diacritics")
                    createRow(start: 10, end: 14, big : false)
                    Spacer().frame(height: 100)
                     ForEach(0..<3) { x in
                         ForEach(0..<Info.katList[x].count) { y in
                             Text(Info.katList[x][y])
                         }
                     }
                     */
                    createRow(start: 0, end: 6, big: false)
                    Spacer().frame(height: 100)
                    getLabel2(label: "Diacritics")
                    createRow(start: 10, end: 14, big : false)
                    Spacer().frame(height: 100)
                   
                    
                }
                VStack{
                    
                    getLabel2(label: "Diagraphs")
                    createRow(start: 14, end: 17, big : true)
                    Spacer().frame(height: 20)
                    createRow(start: 17, end: 20, big : true)
                    Spacer().frame(height: 20)
                    createRow(start: 20, end: 23, big : true)
                     
                    
                }
                .onAppear(){
                    print(Info.katList[0][0])
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
            Spacer().frame(height: 40)
            HStack {
                ForEach(0..<Info.katList[x].count) { y in
                    createButton(labelKat: isKat ? Info.katList[x][y] : Info.hirList[x][y], labelRom: Info.romList[x][y], x: x, y: y, big: big)
                }
            }
        }
    }
    
    func getLabel2(label: String) -> some View{
        
        Text(label)
            .frame(width:  200 , height: 50 )
            .font(.system(size: 30,weight:.bold))
            .foregroundColor(Color.white)
            .background(Color.Medium)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .opacity(opacity)
        
        
        
    }
    func createButton(labelKat: String, labelRom: String, x: Int, y: Int ,big: Bool) -> some View {
        Button(action: {
            
            isRom[x][y].toggle()
            withAnimation(.easeInOut) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isRom[x][y].toggle()
                }
            }
        }) {
            Text(isRom[x][y] ? labelRom : labelKat)
                .frame(width: !big ? 60 : 80, height: 60)
                .font(.system(size: !big ? 35: 35, weight: .bold))
                .foregroundColor(Color.white)
                .background(Color.Easy)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .opacity( opacity)
            
        }.buttonStyle(PlainButtonStyle())
    }
    
    
    func menuButton() -> some View{
        
        //>>> MENU >>>
        Button(action: {
            
            
            offsetY = -200
            withAnimation(.easeInOut(duration: 0.2)){
                opacity = 0
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    nextPage = true
                }
            }
            
        })  {
            Text("menu")
                .frame( width: 130,height: 50)
                .font(.system(size:30,weight:.bold))
                .foregroundColor(Color.white)
                .background(Color.Easy)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .offset(y: 10+offsetY) // Apply the Y offset
                .offset(x:0)
        }
        
        //<<< MENU <<<
    }
    
}


struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView(isKat: .constant(false))
    }
}
