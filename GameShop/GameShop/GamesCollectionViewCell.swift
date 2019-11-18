//
//  GamesCollectionViewCell.swift
//  GameShop
//
//  Created by Max Mendes on 24/10/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import UIKit

class GamesCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var gamePrice: UILabel!
   
    func prepare(with game: Game){
        
        gameImage.image = game.gameImage
        gameName.text = game.gameName
        gamePrice.text = "R$ \(String(format: "%.2f" ,game.gamePrice))"
        
    }
    
}
