//
//  TeamDetailsViewController.swift
//  SportsAllDay
//
//  Created by Khalid hassan on 2/24/21.
//

import UIKit
import SafariServices


class TeamDetailsViewController: UIViewController {

    @IBOutlet weak var stadiumNameLabel: UILabel!
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamYearLabel: UILabel!
    
    var viewedTeam:Team?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamImageView.sd_setImage(with: URL(string: (viewedTeam?.strTeamBadge)!), completed: nil)
        teamNameLabel.text = viewedTeam?.strTeam
        teamYearLabel.text = viewedTeam?.intFormedYear
        stadiumNameLabel.text = viewedTeam?.strStadium

        // Do any additional setup after loading the view.
    }
    

    @IBAction func teamSitebtnAction(_ sender: Any) {
        
        var urlString = viewedTeam?.strWebsite
        if urlString != nil{
        if urlString!.lowercased().hasPrefix("http://")==false{
            urlString = "http://\(urlString ?? "www.google.com")"
        }
        let safariVC = SFSafariViewController(url:URL(string:urlString!)!)
        present(safariVC, animated: true, completion: nil)
    }
    
    }

}
