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
    
    var game: Game!
    var cart: Cart?
   
    
    override func viewDidLoad() {
        print(game?.gameName)
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
