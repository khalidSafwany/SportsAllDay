//
//  DetailsLeagueModel.swift
//  SportsAllDay
//
//  Created by Khalid hassan on 2/19/21.
//

import Foundation

class DetailedLeagueModel:DataFromAPI {
    
    let NWManager = NetworkManager()
    var sportsDelegate:AllSportsProtocol?
    
    private var latestReuslts:[LatestResult]?{
        didSet{
            sportsDelegate?.getLatestResults(latestResultsList: latestReuslts!)
        }
    }
    
    private var leagueTeams:[Team]?{
        didSet{
            sportsDelegate?.getLeagueTeams(leagueTeams: leagueTeams!)
        }
    }
    
    private var similarLeagues:[SimilarLeagueDataModel]?{
        didSet{
            sportsDelegate?.getSimilarLEagues(similarLeagues: similarLeagues!)
        }
    }
    
    
    func start(leagueID:String){
        NWManager.moverFromNetworkToModelDelegate = self
        NWManager.getLatestEventsOfLeague(leagueID: leagueID)
        NWManager.getleagueTeamsFromAPI(leagueID: leagueID)
       
    }
    
    func getLatestEvents(latestEventsList: [LatestResult]) {
        latestReuslts = latestEventsList
    }
    
    func getLeagueTeams(leagueTeams: [Team]) {
        self.leagueTeams = leagueTeams
    }
    
    func getSimilarLeagues(similarLeagues: [SimilarLeagueDataModel]) {
        self.similarLeagues = similarLeagues
    }
    
    
    
}
