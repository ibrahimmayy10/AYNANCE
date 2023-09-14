//
//  YatirimTableViewCell.swift
//  AYNANCE
//
//  Created by İbrahim Ay on 11.08.2023.
//

import UIKit

class YatirimTableViewCell: UITableViewCell {
    
    @IBOutlet weak var yatirimImageView: UIImageView!
    @IBOutlet weak var yatirimNameLabel: UILabel!
    @IBOutlet weak var tutarNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        yatirimNameLabel.text = ""
        tutarNameLabel.text = ""

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
