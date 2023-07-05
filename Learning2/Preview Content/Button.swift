//
//  ButtonView.swift
//  Learning2
//
//  Created by Emmet Carey on 12/06/2023.
//

import SwiftUI
import AVFoundation

struct CustomButton: View {
    
    var data : String
    var isCircle : Bool
    var color : Color
    var buttonOffsetY: CGFloat
    var buttonOffsetX: CGFloat
    var body: some View {
        
        Text("\(data)")
            .frame( width: isCircle ? 110 : 250,height: isCircle ? 110 : 70 )
            .font(.system(size:40,weight:.bold))
            .foregroundColor(Color.white)
            .background(color)
            .clipShape(CustomShape(isCircle: isCircle))
            .offset(y: buttonOffsetY) // Apply the Y offset
            .offset(x: buttonOffsetX)
            .padding()
        
        
    }
}

struct CustomShape: Shape {
    var isCircle: Bool
    
    func path(in rect: CGRect) -> Path {
        if isCircle {
            return Circle().path(in: rect)
        } else {
            return RoundedRectangle(cornerRadius: 10).path(in: rect)
        }
    }
}
struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(data:"カ",isCircle: false, color: Color.Medium , buttonOffsetY: 0,buttonOffsetX: 0)
    }
}
