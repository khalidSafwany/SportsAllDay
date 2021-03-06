//
//  LeagueDetailsViewController.swift
//  SportsAllDay
//
//  Created by Khalid hassan on 2/18/21.
//

import UIKit
import CoreData
import SafariServices

class LeagueDetailsViewController: UIViewController, AllSportsProtocol {
    var wantedLeague:League?
    var wantedLeagueID:String = ""
    var wantedLeagueTitle:String = ""
    
    
    @IBOutlet weak var detailsLeagueBarItem: UINavigationItem!
    
    @IBOutlet weak var nextCollectionView: UICollectionView!
    @IBOutlet weak var latestResultsTable: UITableView!
    
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    
    var leagueDetailsModel:DetailedLeagueModel?
    var latestResultsList:[LatestResult] = []{
        didSet{
            latestResultsTable.reloadData()
            
        }
        
    }
    
    var leagueTeams:[Team] = []{
        didSet{
            teamsCollectionView.reloadData()
        }
    }
    
    var similarLeagues:[SimilarLeagueDataModel] = []{
        didSet{
            nextCollectionView.reloadData()
        }
    }

    
    @IBOutlet weak var favouriteInsideButton: UIButton!
    @IBOutlet weak var favouriteButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        latestResultsTable.dataSource = self
        latestResultsTable.delegate = self
        teamsCollectionView.dataSource = self
        teamsCollectionView.delegate = self
        nextCollectionView.delegate = self
        nextCollectionView.dataSource = self
        leagueDetailsModel = DetailedLeagueModel()
        leagueDetailsModel?.sportsDelegate = self
        if(wantedLeagueID == ""){
            wantedLeagueID = wantedLeague!.idLeague
            wantedLeagueTitle = wantedLeague!.strLeague
        }
        leagueDetailsModel?.start(leagueID: wantedLeagueID)
        
        detailsLeagueBarItem.title = wantedLeagueTitle

        // Do any additional setup after loading the view.
       setBarButton()
        
    }
    
    @IBAction func youTubeButtonAction(_ sender: Any) {
        let button = sender as!UIButton
        var superview = button.superview
            while let view = superview, !(view is UICollectionViewCell) {
                superview = view.superview
            }
            guard let cell = superview as? UICollectionViewCell else {
                return
            }
            guard let indexPath = nextCollectionView.indexPath(for: cell) else {
                return
            }
        
        var urlString = similarLeagues[indexPath.row].strYoutube!
        if urlString.lowercased().hasPrefix("http://")==false{
             urlString = "http://\(urlString)"
        }
        let safariVC = SFSafariViewController(url:URL(string:urlString)!)
        present(safariVC, animated: true, completion: nil)
    }
    
    func getLatestResults(latestResultsList: [LatestResult]) {
        self.latestResultsList = latestResultsList
    }
    func getLeagueTeams(leagueTeams: [Team]) {
        self.leagueTeams = leagueTeams
    }
    func getSimilarLEagues(similarLeagues: [SimilarLeagueDataModel]) {
        self.similarLeagues = similarLeagues
    }
    
    
    @IBAction func favouriteAction(_ sender: UIButton) {
        if(isFavourited(leagueID: wantedLeagueID)){
        favouriteInsideButton.setImage(UIImage(named: "not-favourite"), for: .normal)
            removeFromFavourites(leagueID: wantedLeagueID)
        }
        else{
            favouriteInsideButton.setImage(UIImage(named: "is-favourite"), for: .normal)
            addLeagueToFavourites(league: wantedLeague!)
        }
      
    }
    
   
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        let teamDetailsVC = segue.destination as! TeamDetailsViewController
        if let selectedIndex = teamsCollectionView.indexPathsForSelectedItems {
    
            teamDetailsVC.viewedTeam = leagueTeams[selectedIndex[0].row]
            //teamDetailsVC.modalPresentationStyle = .fullScreen
        
        }
    }
    
}
