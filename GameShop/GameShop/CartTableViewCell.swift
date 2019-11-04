//
//  CartTableViewCell.swift
//  GameShop
//
//  Created by Max Mendes on 04/11/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    
    @IBOutlet weak var gameImg: UIImageView!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var gamePrice: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepareCell(with cartItem: Cart ){
        
        gameName.text = cartItem.name
        gamePrice.text = "R$ \(String(format: "%.2f" ,cartItem.price))"
    }

}
