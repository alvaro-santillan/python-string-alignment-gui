//
//  PlaySound.swift
//  Sort N Search
//
//  Created by Álvaro Santillan on 4/24/21.
//  Copyright © 2021 Álvaro Santillan. All rights reserved.
//

import Foundation
import AVFoundation

var songPlayer: AVAudioPlayer?

func PlaySound() {
    
//    let soundArra = ["Background_Music"]
    let path = Bundle.main.path(forResource: "Photon in A-star", ofType:"wav")!
    let url = URL(fileURLWithPath: path)
    let soundOnSetting = UserDefaults.standard.bool(forKey: "Volume On Setting")
    
    
    do {
        // Open cd player put in disk
        let sound = try AVAudioPlayer(contentsOf: url)
        
        if soundOnSetting {
            songPlayer = sound
            sound.numberOfLoops = -1
            sound.prepareToPlay()
            sound.play()
        } else {
            if songPlayer != nil {
                if ((songPlayer?.isPlaying) != nil) {
                    songPlayer?.stop()
                }
            }
        }
    } catch {
        print("error loading file")
        // couldn't load file :(
    }
}
