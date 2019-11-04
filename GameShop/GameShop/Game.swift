//
//  Game.swift
//  GameShop
//
//  Created by Max Mendes on 24/10/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import Foundation
import UIKit

class Game{
    
    var gameImage: UIImage
    var gameName: String
    var gamePrice: Double
    
    init(gameImage: UIImage, gameName: String, gamePrice: Double) {
        self.gameImage = gameImage
        self.gameName = gameName
        self.gamePrice = gamePrice
    }
    
    
}
