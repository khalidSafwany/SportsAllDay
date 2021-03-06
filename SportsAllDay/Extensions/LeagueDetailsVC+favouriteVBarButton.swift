//
//  LeagueDetailsVC+favouriteVBarButton.swift
//  SportsAllDay
//
//  Created by Khalid hassan on 2/19/21.
//

import Foundation
import UIKit
import CoreData
extension LeagueDetailsViewController{
    func setBarButton(){
        if(!isFavourited(leagueID: wantedLeagueID)){
            favouriteInsideButton.setImage(UIImage(named: "not-favourite"), for: .normal)
        }else{
            favouriteInsideButton.setImage(UIImage(named: "is-favourite"), for: .normal)
        }
        favouriteButton.customView!.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
        favouriteButton.customView!.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
        
        
    }
    
    
    
    
}
