//
//  SatinAlVC.swift
//  AYNANCE
//
//  Created by İbrahim Ay on 11.08.2023.
//

import UIKit
import CoreData

class SatinAlVC: UIViewController {
    
    
    @IBOutlet weak var alinanCoinImageView: UIImageView!
    @IBOutlet weak var alinanSembolLabel: UILabel!
    @IBOutlet weak var tutarTextField: UITextField!
    @IBOutlet weak var alinacakSymbolLabel: UILabel!
    
    var selectedItem: CoinsModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        write()
        
    }
    
    func write() {
        guard let symbol = selectedItem?.symbol else { return }
        alinanSembolLabel.text = symbol
        alinacakSymbolLabel.text = symbol
        
        if let selectedItem = selectedItem, let url = URL(string: selectedItem.image!) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.alinanCoinImageView.image = image
                    }
                }
            }.resume()
        }
    }
    
    @IBAction func satinAlButton(_ sender: Any) {
        guard let tutarString = tutarTextField.text else { return }
        let tutar = (Double(tutarString) ?? 0) * (selectedItem?.currentPrice ?? 0)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newCoin = NSEntityDescription.insertNewObject(forEntityName: "Coins", into: context)
        newCoin.setValue(tutar, forKey: "tutar")
        newCoin.setValue(selectedItem?.name, forKey: "name")
        newCoin.setValue(UUID(), forKey: "id")
        
        do {
            try context.save()
        } catch {
            print("error")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil)
        performSegue(withIdentifier: "toYatirimVC", sender: tutar)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toYatirimVC" {
            if let yatirimVC = segue.destination as? YatirimVC, let tutar = sender as? Double {
                yatirimVC.tutar = tutar
            }
        }
    }
    
    @IBAction func satButton(_ sender: Any) {
    }
    
    @IBAction func changeButton(_ sender: Any) {
        guard let coinBuyVC = storyboard?.instantiateViewController(identifier: "toCoinBuyVC") else { return }
        navigationController?.pushViewController(coinBuyVC, animated: true)
    }

}
