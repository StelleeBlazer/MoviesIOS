//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by Mac n Cheese on 10/06/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var cellPoster: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellOverview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
