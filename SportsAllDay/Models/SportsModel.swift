//
//  SportsModel.swift
//  SportsAllDay
//
//  Created by Khalid hassan on 2/16/21.
//

import Foundation
import Alamofire

class SportsModel:DataFromAPI{
    
    let NWManager = NetworkManager()
    
    
    private var sportsList:[Sport]?{
        didSet{
            sportsDelegate?.getAllsportsDelegate(sportsList: sportsList!)
        }
    }
     var sportsDelegate:AllSportsProtocol?
    
   
    //MARK: - init
    init() {
        NWManager.moverFromNetworkToModelDelegate = self
        NWManager.getAllSportsFromAPI()
    }
    
    
    
    internal func getAllSports(sportsList: [Sport]) {
        self.sportsList = sportsList
    }
    
}
