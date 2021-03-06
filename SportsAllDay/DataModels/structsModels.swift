//
//  structsModels.swift
//  SportsAllDay
//
//  Created by Khalid hassan on 2/18/21.
//

import Foundation

struct SportList: Decodable{
    var sports:[Sport]?
}

struct LeaguesList: Decodable {
    var leagues:[League]?
    
    init() {
        leagues = []
    }
}


struct latestResultList:Decodable{
    var events:[LatestResult]?
}

struct LeagueTeamsList:Decodable {
    var teams:[Team]?
}

struct simpleSportLeagues:Decodable {
    var leagues:[SimpleLeagueDataModel]?
}

struct similarLeaguesList:Decodable {
    var countrys:[SimilarLeagueDataModel]?
}
