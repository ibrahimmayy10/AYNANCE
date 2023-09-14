//
//  DetailsVC.swift
//  AYNANCE
//
//  Created by İbrahim Ay on 9.08.2023.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var detailsSymbolLabel: UILabel!
    @IBOutlet weak var detailsNameLabel: UILabel!
    @IBOutlet weak var detailsYuzdeLabel: UILabel!
    @IBOutlet weak var detailsPriceLabel: UILabel!
    
    var selectedItem: CoinsModel?
    var chosenName = ""
    var chosenNameID = UUID()
    var chosenTutar = Double()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        write()
                
    }
    
    func write () {
        detailsNameLabel.text = selectedItem?.name
        detailsSymbolLabel.text = selectedItem?.symbol
        
        guard let priceChange = selectedItem?.priceChange else { return }
        detailsYuzdeLabel.text = "%\(priceChange)"
        
        guard let price = selectedItem?.currentPrice else { return }
        detailsPriceLabel.text = "$\(price)"
        
        if let selectedItem = selectedItem, let image = URL(string: selectedItem.image!) {
            URLSession.shared.dataTask(with: image) { data, response, error in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.detailsImageView.image = image
                    }
                }
            }.resume()
        }
    }
    
    @IBAction func satinAlButton(_ sender: Any) {
        if let satinAlVC = storyboard?.instantiateViewController(identifier: "toSatinAlVC") as? SatinAlVC {
            satinAlVC.selectedItem = selectedItem
            navigationController?.pushViewController(satinAlVC, animated: true)
        }
    }
    
    @IBAction func satButton(_ sender: Any) {
        let yatirimVC = storyboard?.instantiateViewController(identifier: "toYatirimVC") as! YatirimVC
        navigationController?.pushViewController(yatirimVC, animated: true)
    }
    
}
