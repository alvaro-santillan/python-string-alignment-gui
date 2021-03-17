//
//  HelpScreenViewController.swift
//  Snake
//
//  Created by Álvaro Santillan on 3/21/20.
//  Copyright © 2020 Álvaro Santillan. All rights reserved.
//

import UIKit

class HelpScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableVIew: UITableView!
    
    var realRowCount = 3
    var realColumnCount = 3
    var wordOneList = [String]()
    var wordTwoList = [String]()
    var listData = WordDataLoader() // New
    
    let defaults = UserDefaults.standard
    var selectedWordOne = UserDefaults.standard.integer(forKey: "Selected Path Finding Algorithim")
    var selectedWordTwo = UserDefaults.standard.integer(forKey: "Selected Maze Algorithim")
    lazy var tableViewDisplayList = wordOneList
    
    override func viewWillAppear(_ animated: Bool) {
        determinCorrectWordSize()
        listData.loadData(filename: "WordData")
        wordOneList = listData.getEntires(index: realColumnCount)
        wordTwoList = listData.getEntires(index: realRowCount)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        determinCorrectWordSize()
        listData.loadData(filename: "WordData")
        wordOneList = listData.getEntires(index: realColumnCount)
        wordTwoList = listData.getEntires(index: realRowCount)
        
        determinCorrectWordSize()
        loadUserData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadUserData()
    }
    
    func determinCorrectWordSize() {
        let squareWidth = 46
        let frame = UIScreen.main.bounds.size
        // -5 == -4 Due to buffer squares and -1 becouse word plist starts at 0.
        realRowCount = (Int(((frame.height)/CGFloat(squareWidth)).rounded(.up)) - 5)
        realColumnCount = (Int(((frame.width)/CGFloat(squareWidth)).rounded(.up)) - 5)
        print(realRowCount, realColumnCount)
        
    }
    
    func loadUserData() {
        defaults.bool(forKey: "Dark Mode On Setting") ? (overrideUserInterfaceStyle = .dark) : (overrideUserInterfaceStyle = .light)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {return tableViewDisplayList.count}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HelpScreenTableViewCell
        cell.label.text = tableViewDisplayList[indexPath.row]

        return cell
    }
    
    func urlSelector(webURL: String, appURL: String) {
        var selectedURL = String()
        UIApplication.shared.canOpenURL(URL(string: appURL)! as URL) ? (selectedURL = appURL) : (selectedURL = webURL)
        UIApplication.shared.open(URL(string: selectedURL)! as URL, options: [:], completionHandler: nil)
    }

    @IBAction func ReturnToSettingsButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func linkedInButtonTapped(_ sender: UIButton) {
        var webURL = "https://www.linkedin.com/in/álvarosantillan"
        webURL = webURL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!

        var appURL = "linkedin://in/álvarosantillan"
        appURL = appURL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!
        
        urlSelector(webURL: webURL, appURL: appURL)
    }
    
    @IBAction func personalWebisteButtonTapped(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "http://alvarosantillan.com/")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func githubButtonTapped(_ sender: UIButton) {
        var webURL = "https://github.com/AFSM1995"
        webURL = webURL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!
        UIApplication.shared.open(URL(string: webURL)! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func rateButtonTapped(_ sender: UIButton) {
        var webURL = "https://www.linkedin.com/in/álvarosantillan"
        webURL = webURL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!

        let appID = "1555165858"
        var appURL = "http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=\(appID)&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8"
        appURL = appURL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!
        
        urlSelector(webURL: webURL, appURL: appURL)
    }
}
