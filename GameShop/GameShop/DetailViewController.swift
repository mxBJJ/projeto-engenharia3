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
        print(game?.gameName)
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
        
        do{
            try context.save()
        }catch{
            print("Erro ao salvar no carrinho!")
        }
        
        self.tabBarController?.selectedIndex = 2
        
        
    }
    
    func verifyStar(starActive: Bool){
        
        if(starActive == false){
            btnStar.setImage(UIImage(named: "star"), for: .normal)
            game.starState = true
            self.starActive = true
        }else{
            btnStar.setImage(UIImage(named: "star-2"), for: .normal)
            game.starState = false
            self.starActive = false
        }
        
    }
    
    @IBAction func addFavorite(_ sender: Any) {
        
        verifyStar(starActive: starActive)
        
    }
    

}
