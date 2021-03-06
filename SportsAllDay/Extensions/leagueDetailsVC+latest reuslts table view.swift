//
//  leagueDetailsVC+latest reuslts table view.swift
//  SportsAllDay
//
//  Created by Khalid hassan on 2/19/21.
//

import Foundation
import UIKit

extension LeagueDetailsViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return latestResultsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let event = latestResultsList[indexPath.row]
        let cell = latestResultsTable.dequeueReusableCell(withIdentifier: "latestResultCell") as! LatestResultsTableCell
        cell.homeTeamNameLabel.text = event.strHomeTeam
        cell.guestTeamNameLabel.text = event.strAwayTeam
        cell.homeTeamScoreLabel.text = event.intHomeScore
        cell.guestTeamScoreLabel.text = event.intAwayScore
       // cell.detailsLabel.text =  event.strEvent
        return cell
    }
    
    
    
    
    
}
