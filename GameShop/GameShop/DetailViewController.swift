//
//  DetailViewController.swift
//  GameShop
//
//  Created by Max Mendes on 31/10/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    @IBOutlet weak var gameImg: UIImageView!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var gamePrice: UILabel!
    @IBOutlet weak var btnStar: UIButton!
    
    var game: Game!
    var cart: Cart?
    var favorite: Favorite!
    var starActive: Bool!
    var fetchedResultsController:NSFetchedResultsController<Favorite>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(game?.gameName ?? "Empty")
        
        starActive = game.starState
        
        game.starState = UserDefaults.standard.bool(forKey: "\(game.gameName)")
        
        starActive = game.starState

        
        if(starActive == false){
            btnStar.setImage(UIImage(named: "star-2"), for: .normal)
        }else{
            btnStar.setImage(UIImage(named: "star"), for: .normal)
        }
        
        
        if let name = game?.gameName {
            gameName.text = name
        }
        
        if let image = game?.gameImage {
            gameImg.image = image
        }
        
        
        if let price = game?.gamePrice {
            gamePrice.text = "R$ \(String(format: "%.2f", price))"
        }
        
}
        
    override func viewWillAppear(_ animated: Bool) {
        starActive =  UserDefaults.standard.bool(forKey: "\(game.gameName)")
        if(starActive == false){
                   btnStar.setImage(UIImage(named: "star-2"), for: .normal)
               }else{
                   btnStar.setImage(UIImage(named: "star"), for: .normal)
               }
    }
    
    
    @IBAction func buyAction(_ sender: Any) {
        
        if cart == nil{
            
            let cartItem = Cart(context: context)
            
            cartItem.name = game.gameName
            cartItem.price = game.gamePrice
            cartItem.image = game.gameImage
            print("Created game!")
            
        }
        
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        if context.hasChanges {
            do {
                try context.save()
                let alert = UIAlertController(title: "Adicionado ao carrinho", message: "Seu game foi adicionado ao carrinho com sucesso! Caso o item já esteja no carrinho, nos informe a quantidade desejada.", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(alert, animated: true)
                self.tabBarController?.selectedIndex = 2
                
            } catch {
                
                print("Error!")
            }
        }
        
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
    
    func verifyStar(starActive: Bool){
        
        if(starActive == false){
            btnStar.setImage(UIImage(named: "star"), for: .normal)
            self.starActive = true
            game.starState = true
            UserDefaults.standard.set(true, forKey: "\(game.gameName)")
            
            if favorite == nil{
                let favoriteItem = Favorite(context: context)
                favoriteItem.image = game.gameImage
                favoriteItem.name = game.gameName
                print("Created favorite")
                let alert = UIAlertController(title: "Favoritos", message: "Seu game foi adicionado aos favoritos com sucesso! Confira na sua aba favoritos.", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(alert, animated: true)
            }
            
            context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            if context.hasChanges{
                do{
                    try context.save()
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }else{
            btnStar.setImage(UIImage(named: "star-2"), for: .normal)
            self.starActive = false
            game.starState = false
            UserDefaults.standard.set(false, forKey: "\(game.gameName)")
            loadFavorites()
            guard let favorites = fetchedResultsController.fetchedObjects else{return}
            
            for f in favorites{
                if(f.name == game.gameName){
                    context.delete(f)
                    do{
                        try context.save()
                    }catch{
                        print("Fail on save!")
                    }
                
                }
            }
            
        }
        
    }
    
    @IBAction func addFavorite(_ sender: Any) {
        
        verifyStar(starActive: starActive)
        
        
    }
    
}

extension DetailViewController: NSFetchedResultsControllerDelegate{
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        
    }
    
}
