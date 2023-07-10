//
//  SwiftUIView.swift
//  Learning2
//
//  Created by Emmet Carey on 07/07/2023.
//

import SwiftUI

struct SwiftUIView: View {
   
    var body: some View {
        VStack{
            Button(action: {
               
                
                
            }){Text("add")}
            
            Button(action: {
                resetJSON()
                
                    
            }){Text("reset")}
                
                
                
                
            
        }.onAppear(){
            
            
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
