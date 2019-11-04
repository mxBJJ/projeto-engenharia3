//
//  HomeViewController.swift
//  GameShop
//
//  Created by Max Mendes on 24/10/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var gamesCollectionView: UICollectionView!
    @IBOutlet weak var releasesCollectionView: UICollectionView!
    var gamesRelease: [Game] = []
    var games: [Game] = []
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initReleaseGames()
        initGames()
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("touch")
    }
    
    
    func initReleaseGames(){
        
        let game1 = Game(gameImage: UIImage.init(named: "0")!, gameName: "Mortal Kombat 11", gamePrice: 179.90)
        let game2 = Game(gameImage: UIImage.init(named: "1")!, gameName: "Resident Evil 2 - Remake", gamePrice: 149.90)
        let game3 = Game(gameImage: UIImage.init(named: "6")!, gameName: "Far Cry 5", gamePrice: 189.90)
        let game4 = Game(gameImage: UIImage.init(named: "3")!, gameName: "Spider-Man", gamePrice: 179.90)
        let game5 = Game(gameImage: UIImage.init(named: "10")!, gameName: "Monster Hunter World", gamePrice: 249.90)
        
        
        gamesRelease.append(game1)
        gamesRelease.append(game2)
        gamesRelease.append(game3)
        gamesRelease.append(game4)
        gamesRelease.append(game5)
        
    }
    
    func initGames(){
        
        let game1 = Game(gameImage: UIImage.init(named: "0")!, gameName: "Mortal Kombat 11", gamePrice: 179.90)
        let game2 = Game(gameImage: UIImage.init(named: "1")!, gameName: "Resident Evil 2 - Remake", gamePrice: 149.90)
        let game3 = Game(gameImage: UIImage.init(named: "6")!, gameName: "Far Cry 5", gamePrice: 189.90)
        let game4 = Game(gameImage: UIImage.init(named: "3")!, gameName: "Spider-Man", gamePrice: 179.90)
        let game5 = Game(gameImage: UIImage.init(named: "10")!, gameName: "Monster Hunter World", gamePrice: 249.90)
        let game6 = Game(gameImage: UIImage.init(named: "2")!, gameName: "Battlefield 1", gamePrice: 79.90)
        let game7 = Game(gameImage: UIImage.init(named: "4")!, gameName: "Street Fighter V", gamePrice: 69.90)
        
        let game8 = Game(gameImage: UIImage.init(named: "5")!, gameName: "Assassins Creed Odyssey", gamePrice: 99.90)
        let game9 = Game(gameImage: UIImage.init(named: "7")!, gameName: "Bloodborne", gamePrice: 59.90)
        let game10 = Game(gameImage: UIImage.init(named: "8")!, gameName: "Call of Duty - WW2", gamePrice: 149.90)
        
        let game11 = Game(gameImage: UIImage.init(named: "9")!, gameName: "Dying Light", gamePrice: 79.90)
        let game12 = Game(gameImage: UIImage.init(named: "11")!, gameName: "Sniper Elite 4", gamePrice: 79.90)
        let game13 = Game(gameImage: UIImage.init(named: "12")!, gameName: "God of War 3", gamePrice: 49.90)
        let game14 = Game(gameImage: UIImage.init(named: "13")!, gameName: "Doom", gamePrice: 69.90)
        let game15 = Game(gameImage: UIImage.init(named: "14")!, gameName: "PlayerUnknown's Battlegrounds", gamePrice: 139.90)
        let game16 = Game(gameImage: UIImage.init(named: "15")!, gameName: "Horizon Zero Dawn", gamePrice: 249.90)
        
        games.append(game1)
        games.append(game2)
        games.append(game3)
        games.append(game4)
        games.append(game5)
        games.append(game6)
        games.append(game7)
        games.append(game8)
        games.append(game9)
        games.append(game10)
        games.append(game11)
        games.append(game12)
        games.append(game13)
        games.append(game14)
        games.append(game15)
        games.append(game16)
        games.append(game1)
        games.append(game9)
        games.append(game6)
        games.append(game8)
        
    }
    
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        if collectionView == self.releasesCollectionView{
            return gamesRelease.count
        }else{
            return games.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == self.releasesCollectionView{
            
            let cell: ReleaseGamesCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "releases", for: indexPath) as! ReleaseGamesCollectionViewCell
            
            let game = gamesRelease[indexPath.row]
            
            cell.prepare(with: game)
            
            
            //This creates the shadows and modifies the cards a little bit
            cell.contentView.layer.cornerRadius = 4.0
            cell.contentView.layer.borderWidth = 1.0
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            cell.contentView.layer.masksToBounds = false
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            cell.layer.shadowRadius = 2.0
            cell.layer.shadowOpacity = 0.8
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
            
            return cell
        }
        
        
        let cell: GamesCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "games", for: indexPath) as! GamesCollectionViewCell
        
        let game = games[indexPath.row]
        
        cell.prepare(with: game)
        
        //This creates the shadows and modifies the cards a little bit
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 0.8
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("click")
        
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        
        let game = games[indexPath.row]
        vc?.game = game
        self.navigationController?.pushViewController(vc!, animated: true)
    
    }
    
    
    
}

extension HomeViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
}
