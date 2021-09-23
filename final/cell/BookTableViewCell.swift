//
//  TableViewCell.swift
//  final
//
//  Created by Roham on 6/30/1400 AP.
//

import UIKit
import Kingfisher

class BookTableViewCell: UITableViewCell {
    @IBOutlet weak var bookImageView: UIImageView!
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
    
    func load( urlString : String ){
        if let url = URL(string: urlString) {
            bookImageView?.kf.setImage(with: url, options: .none) { result in
                switch result{
                case .success(_):
                    print("Image ok!")
                case .failure(let error):
                    print("error => \(error)")
                }
            }

        }
    }
}
