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
    var starActive: Bool!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(game?.gameName ?? "Empty")
        
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
    
    func verifyStar(starActive: Bool){
        
        if(starActive == false){
            btnStar.setImage(UIImage(named: "star"), for: .normal)
            self.starActive = true
            game.starState = true
            UserDefaults.standard.set(true, forKey: "\(game.gameName)")
            
        }else{
            btnStar.setImage(UIImage(named: "star-2"), for: .normal)
            self.starActive = false
            game.starState = false
            UserDefaults.standard.set(false, forKey: "\(game.gameName)")
            
        }
        
    }
    
    @IBAction func addFavorite(_ sender: Any) {
        
        verifyStar(starActive: starActive)
        
    }
    
    
}
