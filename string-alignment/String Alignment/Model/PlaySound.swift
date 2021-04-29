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
    
    do {
        // Open cd player put in disk
        let sound = try AVAudioPlayer(contentsOf: url)
        songPlayer = sound
        sound.numberOfLoops = -1
        sound.prepareToPlay()
        sound.play()
    } catch {
        print("error loading file")
        // couldn't load file :(
    }
}
