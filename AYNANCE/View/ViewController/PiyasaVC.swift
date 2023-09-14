//
//  PiyasaVC.swift
//  AYNANCE
//
//  Created by İbrahim Ay on 8.08.2023.
//

import UIKit

class PiyasaVC: UIViewController {
    
    var adSoyad = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
    }

    @IBAction func searchButton(_ sender: Any) {
        let coinBuyVC = storyboard?.instantiateViewController(identifier: "toCoinBuyVC")
        navigationController?.pushViewController(coinBuyVC!, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSettingsVC" {
            let destinationVC = segue.destination as! SettingsVC
            destinationVC.adSoyad = adSoyad
        }
    }
    
    @IBAction func settingsButton(_ sender: Any) {
        performSegue(withIdentifier: "toSettingsVC", sender: nil)
    }
    
    @IBAction func yatırmaButton(_ sender: Any) {
        performSegue(withIdentifier: "toCuzdanIslemleriVC", sender: nil)
    }
    
    @IBAction func kriptoAlButton(_ sender: Any) {
        let coinBuyVC = storyboard?.instantiateViewController(identifier: "toCoinBuyVC")
        navigationController?.pushViewController(coinBuyVC!, animated: true)
    }
    
    @IBAction func bitcoinButton(_ sender: Any) {
        let coinBuyVC = storyboard?.instantiateViewController(identifier: "toCoinBuyVC")
        navigationController?.pushViewController(coinBuyVC!, animated: true)
    }
    
    @IBAction func ethereumButton(_ sender: Any) {
        let coinBuyVC = storyboard?.instantiateViewController(identifier: "toCoinBuyVC")
        navigationController?.pushViewController(coinBuyVC!, animated: true)
    }
    
    @IBAction func tetherButton(_ sender: Any) {
        let coinBuyVC = storyboard?.instantiateViewController(identifier: "toCoinBuyVC")
        navigationController?.pushViewController(coinBuyVC!, animated: true)
    }
    
    @IBAction func bnbButton(_ sender: Any) {
        let coinBuyVC = storyboard?.instantiateViewController(identifier: "toCoinBuyVC")
        navigationController?.pushViewController(coinBuyVC!, animated: true)
    }
    
}
