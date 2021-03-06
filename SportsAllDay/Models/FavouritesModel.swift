//
//  FavouritesModel.swift
//  SportsAllDay
//
//  Created by Khalid hassan on 2/27/21.
//

import Foundation
import WebKit
import CoreData

class favouritesModel {
    var favourites:[simplifiedLeagueModel]?{
        didSet{
            favouriteDelegateElement?.getFavourites(favouritesList: favourites!)
        }
    }
    
    var favouriteDelegateElement:favoritesDelegate?
    
    func start(){
      fetchDataFromCoreData()
    }
    
    func fetchDataFromCoreData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest(entityName: "LeagueEntity") as NSFetchRequest<NSManagedObject>
        do{
        let fetchData = try manageContext.fetch(request)
            convertfetchData(fetchedData: fetchData)
            
        }catch let error{
            print(error)
        }
    }
    
    
    func convertfetchData(fetchedData:[NSManagedObject]){
        var tempFavouriteLeagues = [simplifiedLeagueModel]()
        for element in fetchedData as! [LeagueEntity]{
            let newLaegue = simplifiedLeagueModel(leagueId: element.idLeague!, leagueName: element.strSport!, leagueBadge: element.strBadge!)
            tempFavouriteLeagues.append(newLaegue)
        }
        favourites = tempFavouriteLeagues
    }
}
