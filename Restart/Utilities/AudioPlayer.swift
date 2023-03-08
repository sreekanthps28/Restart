//
//  AudioPlayer.swift
//  Restart
//
//  Created by SREEKANTH PS on 07/03/2023.
//

import Foundation
import AVFoundation

private var audioPlayer:AVAudioPlayer?
 
func playSound(sound:String, type:String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
            audioPlayer?.play()
        }catch{
           print("Could not play the sound...")
        }
    }
}
