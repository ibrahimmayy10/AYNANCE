//
//  TableViewCell.swift
//  AYNANCE
//
//  Created by İbrahim Ay on 9.08.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var coinsImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var yuzdeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
    public var item: CoinsModel! {
        didSet {
            self.coinsImageView.load(url: URL(string: item.image!)!)
            self.nameLabel.text = item.name
            self.symbolLabel.text = item.symbol
            self.yuzdeLabel.text = String(item.priceChange)
            self.priceLabel.text = String(item.currentPrice)
        }
    }

}
