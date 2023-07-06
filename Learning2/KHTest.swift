//
//  KHTest.swift
//  Learning2
//
//  Created by Emmet Carey on 06/07/2023.
//

import SwiftUI

struct KHTest: View {
    @State private var isKat = false
    @State private var isMoveButtons = false
    @State private var hirPressed = false
    @State private var katPressed = false
    @State private var finalMove: CGFloat = 0
    @State private var hirOffsetOnHir: CGFloat = -1
    @State private var hirOffsetOnKat: CGFloat = -1
    @State private var labelScale: CGFloat = 1
    @State private var katSmall: Bool = false
    @State private var hirSmall: Bool = false
    

    var body: some View {
        VStack {
            getButton1(label: "Katakana", passKat: true)
            getButton1(label: "Hiragana", passKat: false)
        }
    }
    
    func getButton1(label: String, passKat: Bool) -> some View {
        Button(action: {
            isKat = passKat
            
            withAnimation(.easeInOut) {
              
                if passKat {
                    hirSmall = true
                    katPressed = true
                    isMoveButtons = true
                } else {
                    katSmall = true
                    hirPressed = true
                    isMoveButtons = true
                }
            }
        }) {
            Text(label)
                .frame(width: 260, height: 70)
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(Color.white)
                .background(Color.Medium)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .offset(x: finalMove)
                .scaleEffect(getScale2(isKat: passKat))
                //.offset(y: getOffset(isKat: passKat))
        }
       
    }
    func getScale(isKat: Bool) -> CGFloat{
        
        let hirBtn_HirPress : CGFloat = 1
        let hirBtn_KatPress : CGFloat = 0.5
        
        let katBtn_KatPress : CGFloat = 1
        let katBtn_HirPress : CGFloat = 0.5
        
        return isKat ? (hirPressed ? katBtn_HirPress : (katPressed ? katBtn_KatPress : 1)) :
                     // kat button size when hir pressed and when kat pressed or nothing pressed
                     (katPressed ? hirBtn_KatPress : (hirPressed ? hirBtn_HirPress : 1))
                     // hir button size when kat pressed and when hir pressed or nothing pressed
    }
    
    func getScale2(isKat: Bool) -> CGFloat{
        
        var value : CGFloat = 1
            print("hirPressed: \(hirPressed) \n hirSmall: \(hirSmall) \n isKat: \(isKat) \n katPressed: \(katPressed) \n katSmall: \(katSmall)")
            if hirPressed{
                if !hirSmall{
                    if !isKat{
                        value = 1
                    }
                    else{
                        value = 0.5
                    }
                }
                
            }
            if katPressed{
                if !katSmall{
                    if isKat{
                        value =  1
                    }else{
                        value = 0.5
                    }
                }
            }
        return value
    }
    func getOffset(isKat: Bool) -> CGFloat {
        
        let hirBtn_HirPress : CGFloat = 0
        let hirBtn_KatPress : CGFloat = -200
        
        let katBtn_KatPress : CGFloat = 0
        let katBtn_HirPress : CGFloat = 0
        


        return isKat ? (hirPressed ? katBtn_HirPress : (katPressed ? katBtn_KatPress : 0)) :
                     // kat button movement when hir pressed and when kat pressed or nothing pressed
                     (katPressed ? hirBtn_KatPress : (hirPressed ? hirBtn_HirPress : 0))
                     // hir button movement when kat pressed and when hir pressed or nothing pressed

   
   
    }
    
    
    
    struct KHTest_Previews: PreviewProvider {
        static var previews: some View {
            KHTest()
        }
    }
}
