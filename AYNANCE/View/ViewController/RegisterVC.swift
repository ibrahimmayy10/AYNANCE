//
//  RegisterVC.swift
//  AYNANCE
//
//  Created by İbrahim Ay on 8.08.2023.
//

import UIKit
import CoreData

class RegisterVC: UIViewController {
    
    @IBOutlet weak var adSoyadTextField: UITextField!
    @IBOutlet weak var epostaTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var adSoyad: String?
    var eposta: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toViewController" {
            let destinationVC = segue.destination as! ViewController
            destinationVC.adSoyad = adSoyadTextField.text ?? ""
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        adSoyad = adSoyadTextField.text
        eposta = epostaTextField.text
        password = passwordTextField.text
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPerson = NSEntityDescription.insertNewObject(forEntityName: "KullaniciBilgileri", into: context)
        newPerson.setValue(adSoyad, forKey: "adSoyad")
        newPerson.setValue(eposta, forKey: "eposta")
        newPerson.setValue(password, forKey: "password")
        
        do {
            try context.save()
        } catch {
            print("Error")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil)
        performSegue(withIdentifier: "toViewController", sender: nil)
        
    }

}
