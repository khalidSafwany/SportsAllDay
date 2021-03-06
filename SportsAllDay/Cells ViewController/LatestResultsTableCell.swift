//
//  LatestResultsTableCellTableViewCell.swift
//  SportsAllDay
//
//  Created by Khalid hassan on 2/23/21.
//

import UIKit

class LatestResultsTableCell: UITableViewCell {

    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var guestTeamNameLabel: UILabel!
    
    //@IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var guestTeamScoreLabel: UILabel!
    @IBOutlet weak var homeTeamScoreLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
