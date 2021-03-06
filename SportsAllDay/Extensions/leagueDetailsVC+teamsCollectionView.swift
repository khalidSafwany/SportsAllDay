//
//  leagueDetailsVC+teamsCollectionView.swift
//  SportsAllDay
//
//  Created by Khalid hassan on 2/23/21.
//

import Foundation
import UIKit
import SDWebImage

extension LeagueDetailsViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == self.nextCollectionView){
            return similarLeagues.count
        }
        return leagueTeams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView == self.teamsCollectionView){
        let teamCell = teamsCollectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! teamsCollectionViewCell
        
        teamCell.teamNameLabel.text = leagueTeams[indexPath.row].strTeam
        teamCell.teamImageView.sd_setImage(with:URL(string: leagueTeams[indexPath.row].strTeamBadge!), completed: nil)
        teamCell.teamImageView.isUserInteractionEnabled = false
       
        return teamCell
        }
        else{
            let nextCell = nextCollectionView.dequeueReusableCell(withReuseIdentifier: "nextEventCell", for: indexPath) as! nextCollectionViewCell
            
            nextCell.similarLegueLabel.text = similarLeagues[indexPath.row].strLeague
            if let imageString = similarLeagues[indexPath.row].strLogo{
            nextCell.similarLeagueImageView.sd_setImage(with: URL(string: imageString), completed: nil)
            }
            return nextCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        
        if(collectionView == self.nextCollectionView){
            wantedLeagueID = similarLeagues[indexPath.row].idLeague!
            wantedLeagueTitle = similarLeagues[indexPath.row].strLeague!
            leagueDetailsModel?.start(leagueID: wantedLeagueID)
            detailsLeagueBarItem.title = wantedLeagueTitle
            setBarButton()
        }
    }
    
    
}
