//
//  URL Extension.swift
//  SportsAllDay
//
//  Created by Khalid hassan on 2/16/21.
//

import Foundation

extension String{
    var url:String{
        switch self {
        case "allSports":
            return "https://www.thesportsdb.com/api/v1/json/1/all_sports.php"
        default:
            return ""
        }
    }
}
