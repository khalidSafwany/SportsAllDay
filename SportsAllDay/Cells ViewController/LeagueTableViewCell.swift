//
//  LeagueTableViewCell.swift
//  SportsAllDay
//
//  Created by Khalid hassan on 2/18/21.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueLabel: UILabel!
    @IBOutlet weak var leagueImageView: UIImageView!
    
    @IBOutlet weak var videoButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        leagueImageView.layer.masksToBounds = true
        leagueImageView.layer.cornerRadius = leagueImageView.bounds.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
}
