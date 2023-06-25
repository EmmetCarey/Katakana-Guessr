//
//  Music.swift
//  Learning2
//
//  Created by Emmet Carey on 21/06/2023.
//
import SwiftUI
import AVFoundation

struct Music: View {
    @State var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                
             
                }
                
               
        }
    }



struct Music_Previews: PreviewProvider {
    static var previews: some View {
        Music()
    }
}
