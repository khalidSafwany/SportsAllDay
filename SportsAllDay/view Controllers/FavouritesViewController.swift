//
//  FavouritesViewController.swift
//  SportsAllDay
//
//  Created by Khalid hassan on 2/27/21.
//

import UIKit
import SDWebImage

class FavouritesViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, favoritesDelegate {
   
    @IBOutlet weak var favouritesTableView: UITableView!
    
    var favouritesList:[simplifiedLeagueModel]?{
        didSet{
            favouritesTableView.reloadData()
        }
    }
    
    var model = favouritesModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favouritesTableView.delegate = self
        favouritesTableView.dataSource = self
        model.favouriteDelegateElement = self
        

        // Do any additional setup after loading the view.

    }
    
    override func viewWillAppear(_ animated: Bool) {
        model.start()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouritesList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let favouritesCell = favouritesTableView.dequeueReusableCell(withIdentifier: "favouritesCell") as! FavouritesTableCell
        
        favouritesCell.cellImageView.sd_setImage(with: URL(string: favouritesList![indexPath.row].leagueBadge), completed: nil)
        
        favouritesCell.cellLabel.text = favouritesList![indexPath.row].leagueName
        print(indexPath.row)
        
        
        return favouritesCell
    }
    
    
    func getFavourites(favouritesList: [simplifiedLeagueModel]) {
        self.favouritesList = favouritesList
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
            let detailsVC = segue.destination as! LeagueDetailsViewController
            if let selectedIndex = favouritesTableView.indexPathForSelectedRow {
                detailsVC.wantedLeagueID = favouritesList![selectedIndex.row].leagueId
                detailsVC.wantedLeagueTitle = favouritesList![selectedIndex.row].leagueName
                detailsVC.modalPresentationStyle = .fullScreen
            }
        }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if Connectivity.isConnectedToInternet{
            return true
        }
        showAlert()
        return false
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "No Connection", message: "Check your internet connection", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
