//
//  FavoritesViewController.swift
//  GameShop
//
//  Created by Max Mendes on 19/11/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import UIKit
import CoreData

class FavoritesViewController: UIViewController {
    
    var fetchedResultsController: NSFetchedResultsController<Favorite>!
    var game: Game!
    var starState: Bool!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFavorites()
        
    }
    
    func loadFavorites(){
        
        let fetchRequest:NSFetchRequest<Favorite> = Favorite.fetchRequest()
        let sortDescriptor:NSSortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedResultsController.delegate = self
        
        do{
            try fetchedResultsController.performFetch()
        }catch{
            print(error.localizedDescription)
        }
        
    }
    
}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fetchedResultsController.fetchedObjects?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoritesCell", for: indexPath) as! FavoritesTableViewCell
        
        guard let favorite = fetchedResultsController.fetchedObjects?[indexPath.row] else{return cell}
        
        cell.prepareCell(with: favorite)
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
            guard let favorite = fetchedResultsController.fetchedObjects?[indexPath.row] else{return}
            
            context.delete(favorite)

            UserDefaults.standard.set(false, forKey: String(favorite.name!))
            print(String(favorite.name!))

            do{
                try context.save()
            }catch{
                print("Fail on save!")
            }
            
        }
    }
    
    func setGameStarAtrribute(with game: Game){
        
    }
    
    
}

extension FavoritesViewController: NSFetchedResultsControllerDelegate{
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type{
        case .delete:
            if let indexPath = indexPath{
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
        default:
            tableView.reloadData()
        }
        
    }
}
