//
//  HelpScreenViewController.swift
//  Snake
//
//  Created by Álvaro Santillan on 3/21/20.
//  Copyright © 2020 Álvaro Santillan. All rights reserved.
//

import UIKit
import AVFoundation

class HelpScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableVIew: UITableView!
    
    var soundPlayer: AVAudioPlayer?
    var realRowCount = 3
    var realColumnCount = 3
    var wordOneList = [String]()
    var wordTwoList = [String]()
    var listData = HelpDataLoader() // New
    
    let defaults = UserDefaults.standard
//    var selectedWordOne = UserDefaults.standard.integer(forKey: "Selected Path Finding Algorithim")
//    var selectedWordTwo = UserDefaults.standard.integer(forKey: "Selected Maze Algorithim")
    lazy var tableViewDisplayList = wordOneList
    
    override func viewWillAppear(_ animated: Bool) {
        listData.loadData(filename: "HelpData")
        wordOneList = listData.getEntires(index: 7)
        wordTwoList = listData.getEntires(index: 7)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listData.loadData(filename: "HelpData")
        wordOneList = listData.getEntires(index: 7)
        wordTwoList = listData.getEntires(index: 7)
        loadUserData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadUserData()
    }
    
    func loadUserData() {
        defaults.bool(forKey: "Dark Mode On Setting") ? (overrideUserInterfaceStyle = .dark) : (overrideUserInterfaceStyle = .light)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {return tableViewDisplayList.count}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HelpScreenTableViewCell
        cell.label.text = tableViewDisplayList[indexPath.row]
//        cell.label.numberOfLines = 0

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func urlSelector(webURL: String, appURL: String) {
        var selectedURL = String()
        UIApplication.shared.canOpenURL(URL(string: appURL)! as URL) ? (selectedURL = appURL) : (selectedURL = webURL)
        UIApplication.shared.open(URL(string: selectedURL)! as URL, options: [:], completionHandler: nil)
    }
    
    func playSound() {
        let soundArray = ["A1", "A1 Sharp", "B1", "C1", "C1 Sharp", "D1", "D1 Sharp", "E1", "F1", "F1 Sharp", "G1", "G1 Sharp"]
        let path = Bundle.main.path(forResource: soundArray.randomElement(), ofType:"wav")!
        let url = URL(fileURLWithPath: path)
        
        do {
            // Open cd player put in disk
            let sound = try AVAudioPlayer(contentsOf: url)
            self.soundPlayer = sound
//            sound.numberOfLoops = -1
            sound.prepareToPlay()
            sound.play()
        } catch {
            print("error loading file")
            // couldn't load file :(
        }
    }

    @IBAction func ReturnToSettingsButtonTapped(_ sender: UIButton) {
        playSound()
        self.dismiss(animated: true)
    }
    
    @IBAction func linkedInButtonTapped(_ sender: UIButton) {
        playSound()
        var webURL = "https://www.linkedin.com/in/alvaro-santillan"
        webURL = webURL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!

        var appURL = "linkedin://in/alvaro-santillan"
        appURL = appURL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!
        
        urlSelector(webURL: webURL, appURL: appURL)
    }
    
    @IBAction func personalWebisteButtonTapped(_ sender: UIButton) {
        playSound()
        UIApplication.shared.open(URL(string: "http://alvarosantillan.com/")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func githubButtonTapped(_ sender: UIButton) {
        playSound()
        var webURL = "https://github.com/alvaro-santillan"
        webURL = webURL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!
        UIApplication.shared.open(URL(string: webURL)! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        playSound()
    }
    
    @IBAction func rateButtonTapped(_ sender: UIButton) {
        playSound()
        var webURL = "https://www.linkedin.com/in/alvaro-santillan"
        webURL = webURL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!

        let appID = "1555165858"
        var appURL = "http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=\(appID)&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8"
        appURL = appURL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!
        
        urlSelector(webURL: webURL, appURL: appURL)
    }
}
