//
//  LatestResultsDataModel.swift
//  SportsAllDay
//
//  Created by Khalid hassan on 2/19/21.
//

import Foundation

class LatestResult : Decodable {
    var strEvent:String?
    var strSport:String?
    var strLeague:String?
    var strHomeTeam:String?
    var strAwayTeam:String?
    var intHomeScore:String?
    var intRound:String?
    var intAwayScore:String?
    var dateEventLocal:String?
    var strCountry:String?
}
