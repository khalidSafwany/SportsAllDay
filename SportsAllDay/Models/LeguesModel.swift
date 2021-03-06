//
//  LeguesModel.swift
//  SportsAllDay
//
//  Created by Khalid hassan on 2/18/21.
//

import Foundation

class LeaguesModel: DataFromAPI {
  
    let NWManager = NetworkManager()
    var sportsDelegate:AllSportsProtocol?
    
    private var leaguesList:[League]?{
        didSet{
            sportsDelegate?.getLeaguesFromModel(leaguesList: leaguesList!)
        }
    }
    
    func start(sport:String) {
        NWManager.moverFromNetworkToModelDelegate = self
        NWManager.getAllLeague(sportName: sport)
    }
    
    
    func getLeagues(leaguesList: [League]) {
        self.leaguesList = leaguesList
    }
    
}
