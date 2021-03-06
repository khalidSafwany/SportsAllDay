//
//  NetworkManager.swift
//  SportsAllDay
//
//  Created by Khalid hassan on 2/18/21.
//

import Foundation
import Alamofire

class NetworkManager  {
    
    var moverFromNetworkToModelDelegate:DataFromAPI? = nil
    
    
    //MARK: - api to get lasest Results
    var latestResultFromAPI:latestResultList?{
        didSet{
            if(latestResultFromAPI?.events != nil){
            getSimilarLeaguesFromAPI(country: (latestResultFromAPI?.events![0].strCountry)!)
            moverFromNetworkToModelDelegate?.getLatestEvents(latestEventsList: (latestResultFromAPI?.events)!)
            }
        }
    }
    
    func getLatestEventsOfLeague(leagueID:String){
        AF.request("https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id=\(leagueID)")
            .responseJSON(completionHandler: {
                response in
                switch(response.result){
                case .success(_):
                    if let data = response.data{
                        DispatchQueue.main.async {
                            self.parseLatestEvents(JSONData:data)
                        }
                    }
                    
                case .failure(let error):
                    print(error)
                }
            })
    }
    
    
    
    func parseLatestEvents(JSONData:Data){
        do{
        latestResultFromAPI = try JSONDecoder().decode(latestResultList.self, from: JSONData)
    }
        catch{
            print(error)
        }
    }
    //MARK: - api to get all leagues in sport
    
    var laeguesCounter = -1
    var name = ""
    var leaguesFromAPI:LeaguesList?{
        didSet{
            moverFromNetworkToModelDelegate?.getLeagues(leaguesList: (leaguesFromAPI?.leagues)!)
            
        }
    }
    
    var temPLeaguesFromAPI:LeaguesList?{
        didSet{
            
            leaguesFromAPI = temPLeaguesFromAPI
            
        }
    }
    var simpleLeaguesModel:simpleSportLeagues?{
        didSet{
           
            for league in simpleLeaguesModel?.leagues ?? [] {
                getLeagueDetails(leagueId: league.idLeague!)
            
        }
        }
    }
    var tempSimpleLeaguesModel =  simpleSportLeagues()
    var TempSimpleLeaguesModel:simpleSportLeagues?{
        didSet{
            if(laeguesCounter < 0){
                laeguesCounter += 1
            tempSimpleLeaguesModel.leagues = TempSimpleLeaguesModel?.leagues?.filter({$0.strSport == name})
            simpleLeaguesModel = tempSimpleLeaguesModel
            }
            
        }
    }
    
    
    func getAllLeague(sportName:String){
        name = sportName
        AF.request("https://www.thesportsdb.com/api/v1/json/1/all_leagues.php").responseJSON(completionHandler: {
            response in
            
            switch(response.result){
            case .success(_):
                
                if let data = response.data{
                    DispatchQueue.main.async {
                        self.parseAllSimpleLeagues(JSONData:data, sportName:sportName)
                    }
                }
                
            case .failure(let error):
                print(error)
            }
            
        })
    }
    
    func parseAllSimpleLeagues(JSONData:Data, sportName:String){
        
        
        do{
              TempSimpleLeaguesModel = try JSONDecoder().decode(simpleSportLeagues.self, from: JSONData)
            
            
            
            
        }
        catch{
            print(error)
        }
    }

    func getLeagueDetails(leagueId:String){
        
        AF.request("https://www.thesportsdb.com/api/v1/json/1/lookupleague.php?id=\(leagueId)").responseJSON(completionHandler: {
            response in
            switch(response.result){
            case .success(_):
                
                if let data = response.data{
                    DispatchQueue.main.async {
                        self.parseLeague(JSONData:data)
                    }
                }
                
            case .failure(let error):
                print(error)
            }
        })
    }
    
    var tempLeagues = LeaguesList()
 
    func parseLeague(JSONData: Data){
        
        do{
            let league:LeaguesList = try JSONDecoder().decode(LeaguesList.self, from: JSONData)
            //print(leaguesFromAPI?.countrys as Any)
            if(league.leagues != nil){
                tempLeagues.leagues!.append(league.leagues![0])
            }
            if(tempLeagues.leagues!.count == simpleLeaguesModel?.leagues?.count){
                temPLeaguesFromAPI = tempLeagues
            }
        }
        catch{
            print(error)
        }
        
    }
    
    
    
    //MARK: - api for get all sports
    
    var sportsFromAPI :SportList?{
        didSet{
            moverFromNetworkToModelDelegate?.getAllSports(sportsList: (sportsFromAPI?.sports)!)
        }
    }
    
    func getAllSportsFromAPI(){
        
        AF.request("https://www.thesportsdb.com/api/v1/json/1/all_sports.php").responseJSON(completionHandler: {
            response in
            switch(response.result){
            case .success(_):
                if let data = response.data{
                    DispatchQueue.main.async {
                        self.parseAllSports(JSONData:data)
                    }
                }
                
            case .failure(let error):
                print(error)
            
            }
        })
    }
    
    
   
    
    private func parseAllSports(JSONData: Data){
        do{
            
            sportsFromAPI = try JSONDecoder().decode(SportList.self, from: JSONData)
           
        }
        catch{
            print(error)
        }
        
    }
    
    //MARK: - api for get league teams
    
    
    var leagueTeamsFromAPI:LeagueTeamsList?{
        didSet{
            if (leagueTeamsFromAPI?.teams) != nil{
            moverFromNetworkToModelDelegate?.getLeagueTeams(leagueTeams: (leagueTeamsFromAPI?.teams)!)
        }
        }
    }
    
    func getleagueTeamsFromAPI(leagueID:String){
        
        AF.request("https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id=\(leagueID)").responseJSON(completionHandler: {
            response in
            switch(response.result){
            case .success(_):
                if let data = response.data{
                    DispatchQueue.main.async {
                        self.parseLeagueTeamsData(JSONData:data)
                    }
                }
                
            case .failure(let error):
                print(error)
            
            }
            
            
        })
        
    }
    
    
    func parseLeagueTeamsData(JSONData:Data){
        
        do{
            
            leagueTeamsFromAPI = try JSONDecoder().decode(LeagueTeamsList.self, from: JSONData)
           
        }
        catch{
            print(error)
        }
        
    }
    
    //MARK: - api for get similar leagues
    
    var similarLeaguesFromAPI:similarLeaguesList?{
        didSet{
            if let _ = similarLeaguesFromAPI?.countrys {
            moverFromNetworkToModelDelegate?.getSimilarLeagues(similarLeagues: (similarLeaguesFromAPI?.countrys)!)
            }
        }
    }
    
    func getSimilarLeaguesFromAPI(country:String){
        
        AF.request("https://www.thesportsdb.com/api/v1/json/1/search_all_leagues.php?c=\(country)").responseJSON(completionHandler: {
            response in
            switch(response.result){
            case .success(_):
                if let data = response.data{
                    DispatchQueue.main.async {
                        self.parseSimilarLeagues(JSONData: data)
                    }
                }
                
            case .failure(let error):
                print(error)
            
            }
            
            
        })
    }
    
    
    func parseSimilarLeagues(JSONData:Data){
        
        do{
            
            similarLeaguesFromAPI = try JSONDecoder().decode(similarLeaguesList.self, from: JSONData)
           
        }
        catch{
            print(error)
        }
        
    }
    
    
    
}
