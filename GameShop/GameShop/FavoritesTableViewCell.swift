//
//  FavoritesTableViewCell.swift
//  GameShop
//
//  Created by Max Mendes on 19/11/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import UIKit


class FavoritesTableViewCell: UITableViewCell {
   
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    
    func prepareCell(with favorite: Favorite){
       
        gameImage.image = favorite.image as! UIImage
        gameName.text = favorite.name
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
