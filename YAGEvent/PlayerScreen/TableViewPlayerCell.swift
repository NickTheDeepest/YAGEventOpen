//
//  TableViewPlayerCell.swift
//  123
//
//  Created by Никита on 17.01.2022.
//

import UIKit

class TableViewPlayerCell: UITableViewCell {

    @IBOutlet weak var playerCellLabel: UILabel!
    
    @IBOutlet weak var playerCellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func playerCellSet(playerName: String) {
        playerCellImage.image = UIImage (named: "\(playerName).jpg")
        playerCellLabel.text = playerName
        playerCellImage.layer.cornerRadius = 47
        layer.cornerRadius = 25
    }

}
