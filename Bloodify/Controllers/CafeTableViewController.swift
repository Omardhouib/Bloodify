//
//  CafeTableViewController.swift
//  Cafegram2EN
//
//  Created by Farukh IQBAL on 16/05/2018.
//  Copyright © 2018 Farukh IQBAL. All rights reserved.
//

import UIKit
import MapKit
class CafeTableViewController: UITableViewController {
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        tabBarItem = UITabBarItem(title: "", image: UIImage(named: "2415604-32"), tag: 4)
    }
    var cafes: [Cafe] = [
        Cafe(name: "Banque du Sang de l'Hôpital Charles Nicolle", type: "Tunis", image: "1", phone: "71578000", description: "banque de sang", isVisited: false, long: 36.7408368, lat: 10.2401336),
        Cafe(name: "Banque du Sang de l'Hôpital La Rabta", type: "Tunis", image: "2", phone: "71578700", description: "banque de sang", isVisited: false, long: -157.829445, lat: 21.282777),
        Cafe(name: "Banque du Sang de l'Hôpital Habib Thameur", type: "Tunis", image: "3", phone: "71397000", description: "banque de sang", isVisited: false, long: -157.829445, lat: 21.282777),
        Cafe(name: "Centre Militaire de Transfusion Sanguine", type: "Bardo", image: "4", phone: "71564466", description: "banque de sang", isVisited: false, long: -157.829445, lat: 21.282777),
        Cafe(name: "Banque du Sang de l'Hôpital Régional  ", type: "Bizerte", image: "5", phone: "72422057", description: "banque de sang", isVisited: false, long: -157.829445, lat: 21.282777),
        Cafe(name: "Banque du Sang de l'Hôpital Régional ", type: "Menzel Bourguiba", image: "4", phone: "72460455", description: "banque de sang", isVisited: false, long: -157.829445, lat: 21.282777),
        Cafe(name: "Banque du Sang de l'Hôpital Régional  ", type: "Béja", image: "5", phone: "78455431", description: "banque de sang", isVisited: false, long: -157.829445, lat: 21.282777),
        Cafe(name: "CRTS ", type: "Jendouba", image: "4", phone: "78603600", description: "banque de sang", isVisited: false, long: -157.829445, lat: 21.282777),
        Cafe(name: "Banque du Sang de l'Hôpital Régional", type: "Nabeul", image: "4", phone: "72285633", description: "banque de sang", isVisited: false, long: -157.829445, lat: 21.282777),
        Cafe(name: " Banque du Sang de l'Hôpital Régional ", type: "Menzel Témime", image: "5", phone: "72344155", description: "banque de sang", isVisited: false, long: -157.829445, lat: 21.282777),
        Cafe(name: " Banque du Sang de l'Hôpital de Circonscription", type: "Grombalia", image: "5", phone: "72255612", description: "banque de sang", isVisited: false, long: -157.829445, lat: 21.282777),
        Cafe(name: "Banque du Sang de l'Hôpital Régional ", type: "Zaghouan", image: "4", phone: "72676700", description: "banque de sang", isVisited: false, long: -157.829445, lat: 21.282777),
        Cafe(name: "Banque du Sang de l'Hôpital Régional ", type: "Kef", image: "5", phone: "78228923", description: "banque de sang", isVisited: false, long: -157.829445, lat: 21.282777),
        Cafe(name: "Banque du Sang de l'Hôpital Régional ", type: "Siliana", image: "4", phone: "78872800", description: "banque de sang", isVisited: false, long: -157.829445, lat: 21.282777),
        Cafe(name: "CRTS", type: "Sousse", image: "4", phone: "73223311", description: "banque de sang", isVisited: false, long: -157.829445, lat: 21.282777),
        Cafe(name: "Banque du Sang de l'Hôpital Sahloul ", type: "Sousse", image: "5", phone: "73369411", description: "banque de sang", isVisited: false, long: -157.829445, lat: 21.282777)
    ]

    // MARK:- View controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
        
        // Customize the navigation bar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        if let customFont = UIFont(name: "Rubik-Medium", size: 40.0) {
            // For Xcode 9 users, NSAttributedString.Key is equal to NSAttributedStringKey
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 153.0/255.0, alpha: 1), NSAttributedString.Key.font: customFont]
        }
        
       // navigationController?.hidesBarsOnSwipe = true
    }
    
   /* override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK:- UITableViewDataSource Protocol

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cafes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CafeTableViewCell

        // Configure the cell...
        cell.nameLabel.text = cafes[indexPath.row].name
      //  cell.locationLabel.text = cafes[indexPath.row].location
        cell.typeLabel.text = cafes[indexPath.row].type
        cell.thumbnailImageView.image = UIImage(named: cafes[indexPath.row].image)
        
        cell.accessoryType = cafes[indexPath.row].isVisited ? .checkmark : .none

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    // MARK:- UITableViewDelegate Protocol
        
 /*   override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            // Delete the row from the data source
            self.cafes.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            // Call completion handler to dismiss the action button
            completionHandler(true)
        }
        
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandler) in
            let defaultText = "Just checking in at " + self.cafes[indexPath.row].name
            
            let activityController: UIActivityViewController
            
            if let imageToShare = UIImage(named: self.cafes[indexPath.row].image) {
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }
        
        deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(named: "delete")
        
        shareAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(named: "share")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        
        return swipeConfiguration
    }*/
    
   /* override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let checkInAction = UIContextualAction(style: .normal, title: "Check-in") { (action, sourceView, completionHandler) in
            let cell = tableView.cellForRow(at: indexPath) as! CafeTableViewCell
            self.cafes[indexPath.row].isVisited = (self.cafes[indexPath.row].isVisited) ? false : true
            cell.accessoryType = (self.cafes[indexPath.row].isVisited) ? .checkmark : .none
            
            completionHandler(true)
        }
        
        // Customize the action button
        checkInAction.backgroundColor = UIColor(red: 39, green: 174, blue: 96)
        
        checkInAction.image = self.cafes[indexPath.row].isVisited ? UIImage(named: "undo") : UIImage(named: "tick")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkInAction])
        
        return swipeConfiguration
    }*/
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCafeDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! CafeDetailViewController
                destinationController.cafe = cafes[indexPath.row]
            }
        }
    }


}
