//
//  SettingsVC.swift
//  AYNANCE
//
//  Created by İbrahim Ay on 12.08.2023.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    var adSoyad = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = adSoyad
        
    }

    @IBAction func logoutButton(_ sender: Any) {
    }
    
}
