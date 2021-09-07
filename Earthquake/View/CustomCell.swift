//
//  CustomCell.swift
//  Earthquake
//
//  Created by Balazs Agnes on 30.08.2021.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var magLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var redView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        redView.layer.cornerRadius = redView.layer.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
