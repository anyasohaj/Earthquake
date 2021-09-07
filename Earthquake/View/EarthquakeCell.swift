//
//  EarthquakeCell.swift
//  Earthquake
//
//  Created by Balazs Agnes on 12.08.2021.
//

import UIKit

class EarthquakeCell: UITableViewCell {

    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var magLabel: UILabel!
    @IBOutlet weak var magView: UIView!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        magView?.layer.cornerRadius = magView.frame.size.height/2
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
       super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
