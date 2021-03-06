//
//  MainScreenViewController.swift
//  SportsAllDay
//
//  Created by Khalid hassan on 2/16/21.
//

import UIKit
import SDWebImage

class MainScreenViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,AllSportsProtocol {
   
    var viewedSportsList:[Sport] = []{
        didSet{
            sportsCollectionView.reloadData()
        }
    }
    
    var sportsModel:SportsModel?
    var selectedSport:Int?
    
    
    @IBOutlet weak var sportsCollectionView: UICollectionView!
    
    
    //MARK: - viewDIDLOAD and start of functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sportsCollectionView.delegate = self
        sportsCollectionView.dataSource = self
        if Connectivity.isConnectedToInternet{
            sportsModel = SportsModel()
            sportsModel!.sportsDelegate = self
        
        }else{
            showAlert()
        }
        // Do any additional setup after loading the view.
    }
    
    //MARK: - collection View functions
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewedSportsList.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sportCell = sportsCollectionView.dequeueReusableCell(withReuseIdentifier: "SportCell", for: indexPath) as! sportsCollectionViewCell
        sportCell.sportNameLabel.text = viewedSportsList[indexPath.row].strSport!
        sportCell.sportImageView.sd_setImage(with: URL(string: viewedSportsList[indexPath.row].strSportThumb!), completed: nil)
        return sportCell
       
    }
    
    
    
    
    
    //MARK: - segue function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let leaguesVC = segue.destination as! LeaguesViewController
        if let selectedIndex = sportsCollectionView.indexPathsForSelectedItems {
    
            leaguesVC.sportWanted = viewedSportsList[selectedIndex[0].row].strSport!
            leaguesVC.modalPresentationStyle = .fullScreen
        
        }
        
        
    }
    

    //MARK: - delegate function
    func getAllsportsDelegate(sportsList: [Sport]) {
        viewedSportsList = sportsList
    }
    
    
    
    func showAlert(){
        let alert = UIAlertController(title: "No Connection", message: "Check your internet connection", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
