//
//  CartViewController.swift
//  GameShop
//
//  Created by Max Mendes on 04/11/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import UIKit
import CoreData

class CartViewController: UIViewController {

    @IBOutlet weak var btnBuy: UIButton!
    @IBOutlet weak var tableViewCart: UITableView!
    
      var fetchedResultsController: NSFetchedResultsController<Cart>!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCart()
        
    }
    
    
    func loadCart(){
        
        let fetchRequest: NSFetchRequest<Cart> = Cart.fetchRequest()
              let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
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

extension CartViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        let count = fetchedResultsController.fetchedObjects?.count ?? 0
        
        count == 0 ? (btnBuy.isHidden = true) : (btnBuy.isHidden = false)
        
        return count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartGame", for: indexPath) as! CartTableViewCell
        
        
        guard let cartItem = fetchedResultsController.fetchedObjects?[indexPath.row] else{return cell}
        
        cell.prepareCell(with: cartItem)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
            guard let game = fetchedResultsController.fetchedObjects?[indexPath.row] else {return}
         
            context.delete(game)
            
            do{
                try context.save()
            }catch{
                print("Fail on save!")
            }
            
        }
    }

}

extension CartViewController: NSFetchedResultsControllerDelegate{
  
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {

        switch type {
        case .delete:
            if let indexPath = indexPath{
                tableViewCart.deleteRows(at: [indexPath], with: .fade)
    
            }
        default:
            tableViewCart.reloadData()
        }
    }
    
}
