//
//  TableViewCell.swift
//  final
//
//  Created by Roham on 6/30/1400 AP.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var titleDataLabel: UILabel!
    @IBOutlet weak var pageCountDataLabel: UILabel!
    @IBOutlet weak var ratingCountDataLabel: UILabel!
    @IBOutlet weak var avgratingDataLabel: UILabel!
    @IBOutlet weak var titleStackView: UIStackView!
    @IBOutlet weak var pageCountStackView: UIStackView!
    @IBOutlet weak var ratingCountStackView: UIStackView!
    @IBOutlet weak var avgRatingStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
