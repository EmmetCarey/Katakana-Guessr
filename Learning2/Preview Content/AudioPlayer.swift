//
//  AudioPlayer.swift
//  Learning2
//
//  Created by Emmet Carey on 06/07/2023.
//

// AudioPlayer.swift
import Foundation
import AVFoundation


public class AudioPlayer {
    private static var audioPlayer1: AVAudioPlayer?
    
    public static func playAudio(file: String) {
        guard let audioFileURL = Bundle.main.url(forResource: file, withExtension: "mp3") else {
            return
        }
        
        do {
            audioPlayer1 = try AVAudioPlayer(contentsOf: audioFileURL)
            audioPlayer1?.play()
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
}
