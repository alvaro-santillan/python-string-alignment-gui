//
//  HelpDataLoader.swift
//  Sort N Search
//
//  Created by Álvaro Santillan on 3/16/21.
//  Copyright © 2021 Álvaro Santillan. All rights reserved.
//

import Foundation

class HelpDataLoader {
    var helpData = [HelpData]()
    
    func loadData(filename: String) {
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist"){
            let plistDecoder = PropertyListDecoder()
            
            do {
                let data = try Data(contentsOf: pathURL)
                helpData = try plistDecoder.decode([HelpData].self, from: data)
            } catch {
                print("O no Bob")
            }
        }
    }
    
    func getEntires(index: Int) -> [String] {helpData[index].entries}
}
