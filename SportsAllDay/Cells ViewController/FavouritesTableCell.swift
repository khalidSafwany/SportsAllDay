//
//  FavouritesTableCellTableViewCell.swift
//  SportsAllDay
//
//  Created by Khalid hassan on 2/27/21.
//

import UIKit

class FavouritesTableCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
