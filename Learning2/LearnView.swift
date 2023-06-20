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
    
    var body: some View {
        ZStack{
            
            Color.Beige.edgesIgnoringSafeArea(.all)
      
            BackgroundView()
                .opacity(0.06)
            
            ScrollView(showsIndicators: false){
                Spacer().frame(height: 50)
                VStack {
                    menuButton()
                    createRow(start: 0, end: 10)
                    Spacer().frame(height: 100)
                }.fullScreenCover(isPresented: $nextPage){
                    GOView()
                }
            }
            
        }
    }
    
    func createRow(start: Int, end: Int) -> some View {
        ForEach(start..<end) { x in
            Spacer().frame(height: 40)
            HStack {
                ForEach(0..<Info.katList[x].count) { y in
                    createButton(labelKat: isKat ? Info.katList[x][y] : Info.hirList[x][y], labelRom: Info.romList[x][y], x: x, y: y)
                }
            }
        }
    }
    
    func createButton(labelKat: String, labelRom: String, x: Int, y: Int) -> some View {
        Button(action: {
            isRom[x][y].toggle()
            withAnimation(.easeInOut) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isRom[x][y].toggle()
                }
            }
        }) {
            Text(isRom[x][y] ? labelRom : labelKat)
                .frame(width:  !isRom[x][y] ? 60 : 65 , height: !isRom[x][y] ? 60 : 65 )
                .font(.system(size: !isRom[x][y] ? 35 : 50 , weight: .bold))
                .foregroundColor(Color.white)
                .background(Color.Medium)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }.buttonStyle(PlainButtonStyle())
    }
    
    
    func menuButton() -> some View{
        
        //>>> MENU >>>
        Button(action: {
            withAnimation(.easeInOut){
                nextPage=true
            }
            
        })  {
            Text("menu")
                .frame( width: 130,height: 50)
                .font(.system(size:30,weight:.bold))
                .foregroundColor(Color.white)
                .background(Color.Easy)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .offset(y: 10) // Apply the Y offset
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
