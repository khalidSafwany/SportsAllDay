//
//  LeaguesVC+CoreData.swift
//  SportsAllDay
//
//  Created by Khalid hassan on 2/26/21.
//

import Foundation
import UIKit
import CoreData


extension LeagueDetailsViewController{
    
    func addLeagueToFavourites(league:League){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        let newLeague = LeagueEntity(context:manageContext)
        
        newLeague.idLeague = league.idLeague
        newLeague.strBadge = league.strBadge
        newLeague.strSport = league.strLeague
        
        do{
        try manageContext.save()
            print("saved to coreData")
        }catch let error{
            print(error)
            }
        
        
        
    }
    
    func isFavourited(leagueID:String) -> Bool{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "LeagueEntity")
        fetchRequest.predicate = NSPredicate(format: "idLeague == %@", leagueID)
        do{
        let foundRecord = try manageContext.fetch(fetchRequest)
                
            if foundRecord.count != 0{
                return true
            }
            
        
        }catch let error{
            print(error)
        }
        return false
    }
    
    func removeFromFavourites(leagueID:String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "LeagueEntity")
        fetchRequest.predicate = NSPredicate(format: "idLeague == %@", leagueID)
        
        do{
        let foundRecord = try manageContext.fetch(fetchRequest)
                
            if foundRecord.count != 0{
                for item in foundRecord{
                manageContext.delete(item)
                    
            }
            }
        try manageContext.save()
            print("league removed")
        }catch let error{
            print(error)
        }
        
       
        
    }
    
    
}
