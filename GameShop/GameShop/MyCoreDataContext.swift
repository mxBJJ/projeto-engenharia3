//
//  MyCoreDataContext.swift
//  GameShop
//
//  Created by Max Mendes on 04/11/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension UIViewController{
    
    var context: NSManagedObjectContext{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }
    
}
