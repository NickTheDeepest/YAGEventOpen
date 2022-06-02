//
//  BuildingTableViewCell.swift
//  YAGEvent
//
//  Created by Никита on 15.02.2022.
//

import UIKit

class BuildingTableViewCell: UITableViewCell {

    @IBOutlet weak var buildingMainLabel: UILabel!
    @IBOutlet weak var buildingNameLabel: UILabel!
    @IBOutlet weak var buildingDetailsLabel: UILabel!
    var building = [""]
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func buildingCellSet(building: [String]) {
        buildingMainLabel.text = building[0]
        buildingNameLabel.text = building[1]
        buildingDetailsLabel.text = building[2]
        
        
    }
    
}
