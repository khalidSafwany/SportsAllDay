//
//  DataFromAPIProtocol.swift
//  SportsAllDay
//
//  Created by Khalid hassan on 2/18/21.
//

import Foundation

 protocol DataFromAPI {
    
    
    func getAllSports(sportsList:[Sport])
    func getLeagues(leaguesList:[League])
    func getLatestEvents(latestEventsList:[LatestResult])
    func getLeagueTeams(leagueTeams:[Team])
    func getSimilarLeagues(similarLeagues:[SimilarLeagueDataModel])
}
extension DataFromAPI{
    func getAllSports(sportsList:[Sport]){}
    func getLeagues(leaguesList:[League]){}
    func getLatestEvents(latestEventsList:[LatestResult]){}
    func getLeagueTeams(leagueTeams:[Team]){}
    func getSimilarLeagues(similarLeagues:[SimilarLeagueDataModel]){}
}
