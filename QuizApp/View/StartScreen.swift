//
//  StartScreen.swift
//  QuizApp
//
//  Created by user159106 on 11/17/19.
//  Copyright © 2019 user159106. All rights reserved.
//

import UIKit

class StartScreen: UIViewController {
        
    var themesFactory = QuizzThemeFactory.init()
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
		
   

}
extension StartScreen : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.themesFactory.themes.themes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "themeCell", for: indexPath)
        
        cell.textLabel?.text = themesFactory.themes.themes[indexPath.row].Title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "cellTap", sender: self)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
}
