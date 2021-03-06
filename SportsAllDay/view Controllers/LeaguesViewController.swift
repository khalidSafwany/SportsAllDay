//
//  LeaguesViewController.swift
//  SportsAllDay
//
//  Created by Khalid hassan on 2/18/21.
//

import UIKit
import SDWebImage
import SafariServices


class LeaguesViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, AllSportsProtocol {
    
    var sportWanted:String = ""
    
    var leaguesModel:LeaguesModel?
    var viewedLeaguesList:[League] = []{
        didSet{
            leaguesTableView.reloadData()
        }
    }
    @IBOutlet weak var leaguesTableView: UITableView!
    
    
    //MARK: - view Did load and start of functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leaguesModel = LeaguesModel()
        leaguesModel?.sportsDelegate = self
        leaguesModel?.start(sport: sportWanted)
        
        leaguesTableView.delegate = self
        leaguesTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - tbleView functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewedLeaguesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leaguesTableView.dequeueReusableCell(withIdentifier: "leagueCell") as! LeagueTableViewCell
        
        cell.leagueLabel.text = viewedLeaguesList[indexPath.row].strLeague
        if viewedLeaguesList[indexPath.row].strBadge != nil{
        cell.leagueImageView.sd_setImage(with: URL(string:viewedLeaguesList[indexPath.row].strBadge! ), completed: nil)
        }
        if(viewedLeaguesList[indexPath.row].strYoutube == ""){
            cell.videoButton.isHidden = true
            cell.videoButton.isEnabled = false
        }
        
        return cell
    }
    
    
    
    //MARK: - back action
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - delegate function
    
    func getLeaguesFromModel(leaguesList: [League]) {
        self.viewedLeaguesList = leaguesList
    }
    
    //MARK: - segue function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        if(segue.identifier == "showWebView"){

            
//            let button = sender as!UIButton
//            var superview = button.superview
//                while let view = superview, !(view is UITableViewCell) {
//                    superview = view.superview
//                }
//                guard let cell = superview as? UITableViewCell else {
//                    return
//                }
//                guard let indexPath = leaguesTableView.indexPath(for: cell) else {
//                    return
//                }
                
               // print("button is in row \(indexPath.row)")
            //let webVC = segue.destination as! webViewController
            
            //videoVC.videoURL = viewedLeaguesList[indexPath.row].strYoutube!
           // webVC.urlString = viewedLeaguesList[indexPath.row].strYoutube!
            
        
//        }
//        else{
//
        let leagueDetailsVC = segue.destination as! LeagueDetailsViewController
        if let selectedIndex = leaguesTableView.indexPathForSelectedRow {
    
            leagueDetailsVC.wantedLeague = viewedLeaguesList[selectedIndex.row]
            //leagueDetailsVC.wantedleagueID = viewedLeaguesList[selectedIndex.row].idLeague
            leagueDetailsVC.modalPresentationStyle = .fullScreen
        
//        }
//        }
    }
    
    }
    
    
    @IBAction func videoAction(_ sender: Any) {
        let button = sender as!UIButton
        var superview = button.superview
            while let view = superview, !(view is UITableViewCell) {
                superview = view.superview
            }
            guard let cell = superview as? UITableViewCell else {
                return
            }
            guard let indexPath = leaguesTableView.indexPath(for: cell) else {
                return
            }
        var urlString = viewedLeaguesList[indexPath.row].strYoutube!
        if urlString.lowercased().hasPrefix("http://")==false{
             urlString = "http://\(urlString)"
        }
        let safariVC = SFSafariViewController(url:URL(string:urlString)!)
        present(safariVC, animated: true, completion: nil)
    }
    
    
    
}
