//
//  AllSportsProtocol.swift
//  SportsAllDay
//
//  Created by Khalid hassan on 2/16/21.
//

import Foundation
protocol AllSportsProtocol {
    func getAllsportsDelegate(sportsList:[Sport])
    func getLeaguesFromModel(leaguesList:[League])
    func getLatestResults(latestResultsList:[LatestResult])
    func getLeagueTeams(leagueTeams:[Team])
    func getSimilarLEagues(similarLeagues:[SimilarLeagueDataModel])
    
}

extension AllSportsProtocol{
    
    func getAllsportsDelegate(sportsList:[Sport]){}
    func getLeaguesFromModel(leaguesList:[League]){}
    func getLatestResults(latestResultsList:[LatestResult]){}
    func getLeagueTeams(leagueTeams:[Team]){}
    func getSimilarLEagues(similarLeagues:[SimilarLeagueDataModel]){}
    
    
}
