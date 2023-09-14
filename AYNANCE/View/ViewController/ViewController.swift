//
//  ViewController.swift
//  AYNANCE
//
//  Created by İbrahim Ay on 7.08.2023.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var epostaLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    var adSoyad = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPiyasaVC" {
            let destinationVC = segue.destination as! PiyasaVC
            destinationVC.adSoyad = adSoyad
        }
    }

    @IBAction func girisButton(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "KullaniciBilgileri")
        
        do {
            let results = try context.fetch(fetchRequest) as! [NSManagedObject]
            
            for data in results {
                let adSoyad = data.value(forKey: "adSoyad") as? String
                let eposta = data.value(forKey: "eposta") as? String
                let password = data.value(forKey: "password") as? String
                
                if eposta == epostaLabel.text && password == passwordLabel.text {
                    performSegue(withIdentifier: "toPiyasaVC", sender: nil)
                    return
                } else {
                    let alert = UIAlertController(title: "Hata", message: "E-posta ya da şifre hatalı", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
                    alert.addAction(okAction)
                    present(alert, animated: true, completion: nil)
                }
            }
        } catch {
            print("error")
        }
    }

}

