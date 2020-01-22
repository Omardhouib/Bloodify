//
//  CafeTableViewController.swift
//  Cafegram2EN
//
//  Created by Farukh IQBAL on 16/05/2018.
//  Copyright © 2018 Farukh IQBAL. All rights reserved.
//

import UIKit

class CafeTableViewController: UITableViewController {
    
    var cafes: [Cafe] = [
        Cafe(name: "Banque du Sang de l'Hôpital Charles Nicolle", type: "Tunis", location: "Hotel Sousse Palace,Susah,Tunisia 4054", image: "1", phone: "71578000", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque quam augue, malesuada a bibendum at, luctus at velit. Sed ornare nibh sed nulla euismod, rutrum gravida metus pulvinar. Fusce vitae purus turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec sem urna, eleifend vel dolor et, dapibus vehicula metus. Donec facilisis tempus mi, quis dictum arcu. In tempus sapien purus. Maecenas sit amet tempor orci, ut condimentum urna. Suspendisse ut elit in nisi cursus pretium.", isVisited: false),
        Cafe(name: "Banque du Sang de l'Hôpital La Rabta", type: "Tunis", location: "tunisie,tunis,Hôpital La Rabta 1006", image: "2", phone: "71578700", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque quam augue, malesuada a bibendum at, luctus at velit. Sed ornare nibh sed nulla euismod, rutrum gravida metus pulvinar. Fusce vitae purus turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec sem urna, eleifend vel dolor et, dapibus vehicula metus. Donec facilisis tempus mi, quis dictum arcu. In tempus sapien purus. Maecenas sit amet tempor orci, ut condimentum urna. Suspendisse ut elit in nisi cursus pretium.", isVisited: false),
        Cafe(name: "Banque du Sang de l'Hôpital Habib Thameur", type: "Tunis", location: "Hôpital Habib Thameur 1069 ,Tunis,Tunisia", image: "3", phone: "71397000", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque quam augue, malesuada a bibendum at, luctus at velit. Sed ornare nibh sed nulla euismod, rutrum gravida metus pulvinar. Fusce vitae purus turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec sem urna, eleifend vel dolor et, dapibus vehicula metus. Donec facilisis tempus mi, quis dictum arcu. In tempus sapien purus. Maecenas sit amet tempor orci, ut condimentum urna. Suspendisse ut elit in nisi cursus pretium.", isVisited: false),
        Cafe(name: "Centre Militaire de Transfusion Sanguine", type: "Bardo", location: "1, Rue de Etats-Unis, Ras Tabia, 2000 Le Bardo", image: "4", phone: "71564466", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque quam augue, malesuada a bibendum at, luctus at velit. Sed ornare nibh sed nulla euismod, rutrum gravida metus pulvinar. Fusce vitae purus turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec sem urna, eleifend vel dolor et, dapibus vehicula metus. Donec facilisis tempus mi, quis dictum arcu. In tempus sapien purus. Maecenas sit amet tempor orci, ut condimentum urna. Suspendisse ut elit in nisi cursus pretium.", isVisited: false),
        Cafe(name: "Banque du Sang de l'Hôpital Régional  ", type: "Bizerte", location: "Hôpital Régional de Bizerte 7000 Bizerte", image: "5", phone: "72422057", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque quam augue, malesuada a bibendum at, luctus at velit. Sed ornare nibh sed nulla euismod, rutrum gravida metus pulvinar. Fusce vitae purus turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec sem urna, eleifend vel dolor et, dapibus vehicula metus. Donec facilisis tempus mi, quis dictum arcu. In tempus sapien purus. Maecenas sit amet tempor orci, ut condimentum urna. Suspendisse ut elit in nisi cursus pretium.", isVisited: false),
        Cafe(name: "Banque du Sang de l'Hôpital Régional ", type: "Menzel Bourguiba", location: "Hopital Régional de Menzel Bourguiba 7050 Menzel Bourguiba", image: "4", phone: "72460455", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque quam augue, malesuada a bibendum at, luctus at velit. Sed ornare nibh sed nulla euismod, rutrum gravida metus pulvinar. Fusce vitae purus turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec sem urna, eleifend vel dolor et, dapibus vehicula metus. Donec facilisis tempus mi, quis dictum arcu. In tempus sapien purus. Maecenas sit amet tempor orci, ut condimentum urna. Suspendisse ut elit in nisi cursus pretium.", isVisited: false),
        Cafe(name: "Banque du Sang de l'Hôpital Régional  ", type: "Béja", location: " Hôpital Régional de Béja 9000 Béja", image: "5", phone: "78455431", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque quam augue, malesuada a bibendum at, luctus at velit. Sed ornare nibh sed nulla euismod, rutrum gravida metus pulvinar. Fusce vitae purus turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec sem urna, eleifend vel dolor et, dapibus vehicula metus. Donec facilisis tempus mi, quis dictum arcu. In tempus sapien purus. Maecenas sit amet tempor orci, ut condimentum urna. Suspendisse ut elit in nisi cursus pretium.", isVisited: false),
        Cafe(name: "CRTS ", type: "Jendouba", location: "Hôpital Régional de Jendouba 8100 Jendouba", image: "4", phone: "78603600", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque quam augue, malesuada a bibendum at, luctus at velit. Sed ornare nibh sed nulla euismod, rutrum gravida metus pulvinar. Fusce vitae purus turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec sem urna, eleifend vel dolor et, dapibus vehicula metus. Donec facilisis tempus mi, quis dictum arcu. In tempus sapien purus. Maecenas sit amet tempor orci, ut condimentum urna. Suspendisse ut elit in nisi cursus pretium.", isVisited: false),
        Cafe(name: "Banque du Sang de l'Hôpital Régional", type: "Nabeul", location: "Hôpital Régional de Nabeul 8000 Nabeul", image: "4", phone: "72285633", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque quam augue, malesuada a bibendum at, luctus at velit. Sed ornare nibh sed nulla euismod, rutrum gravida metus pulvinar. Fusce vitae purus turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec sem urna, eleifend vel dolor et, dapibus vehicula metus. Donec facilisis tempus mi, quis dictum arcu. In tempus sapien purus. Maecenas sit amet tempor orci, ut condimentum urna. Suspendisse ut elit in nisi cursus pretium.", isVisited: false),
        Cafe(name: " Banque du Sang de l'Hôpital Régional ", type: "Menzel Témime", location: "Hôpital Régional de Menzel Témime", image: "5", phone: "72344155", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque quam augue, malesuada a bibendum at, luctus at velit. Sed ornare nibh sed nulla euismod, rutrum gravida metus pulvinar. Fusce vitae purus turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec sem urna, eleifend vel dolor et, dapibus vehicula metus. Donec facilisis tempus mi, quis dictum arcu. In tempus sapien purus. Maecenas sit amet tempor orci, ut condimentum urna. Suspendisse ut elit in nisi cursus pretium.", isVisited: false),
        Cafe(name: " Banque du Sang de l'Hôpital de Circonscription", type: "Grombalia", location: "Hôpital de Circonscription de Grombalia 8030 Grombalia", image: "5", phone: "72255612", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque quam augue, malesuada a bibendum at, luctus at velit. Sed ornare nibh sed nulla euismod, rutrum gravida metus pulvinar. Fusce vitae purus turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec sem urna, eleifend vel dolor et, dapibus vehicula metus. Donec facilisis tempus mi, quis dictum arcu. In tempus sapien purus. Maecenas sit amet tempor orci, ut condimentum urna. Suspendisse ut elit in nisi cursus pretium.", isVisited: false),
        Cafe(name: "Banque du Sang de l'Hôpital Régional ", type: "Zaghouan", location: "Hôpital Régional de Zaghouan 1100 Zaghouan", image: "4", phone: "72676700", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque quam augue, malesuada a bibendum at, luctus at velit. Sed ornare nibh sed nulla euismod, rutrum gravida metus pulvinar. Fusce vitae purus turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec sem urna, eleifend vel dolor et, dapibus vehicula metus. Donec facilisis tempus mi, quis dictum arcu. In tempus sapien purus. Maecenas sit amet tempor orci, ut condimentum urna. Suspendisse ut elit in nisi cursus pretium.", isVisited: false),
        Cafe(name: "Banque du Sang de l'Hôpital Régional ", type: "Kef", location: "Hôpital Régional du Kef 7100 Le Kef ", image: "5", phone: "78228923", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque quam augue, malesuada a bibendum at, luctus at velit. Sed ornare nibh sed nulla euismod, rutrum gravida metus pulvinar. Fusce vitae purus turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec sem urna, eleifend vel dolor et, dapibus vehicula metus. Donec facilisis tempus mi, quis dictum arcu. In tempus sapien purus. Maecenas sit amet tempor orci, ut condimentum urna. Suspendisse ut elit in nisi cursus pretium.", isVisited: false),
        Cafe(name: "Banque du Sang de l'Hôpital Régional ", type: "Siliana", location: "Hôpital Régional de Siliana 6100 Siliana", image: "4", phone: "78872800", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque quam augue, malesuada a bibendum at, luctus at velit. Sed ornare nibh sed nulla euismod, rutrum gravida metus pulvinar. Fusce vitae purus turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec sem urna, eleifend vel dolor et, dapibus vehicula metus. Donec facilisis tempus mi, quis dictum arcu. In tempus sapien purus. Maecenas sit amet tempor orci, ut condimentum urna. Suspendisse ut elit in nisi cursus pretium.", isVisited: false),
        Cafe(name: "CRTS", type: "Sousse", location: " Hôpital Farhat Hached de Sousse 4000 Sousse", image: "4", phone: "73223311", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque quam augue, malesuada a bibendum at, luctus at velit. Sed ornare nibh sed nulla euismod, rutrum gravida metus pulvinar. Fusce vitae purus turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec sem urna, eleifend vel dolor et, dapibus vehicula metus. Donec facilisis tempus mi, quis dictum arcu. In tempus sapien purus. Maecenas sit amet tempor orci, ut condimentum urna. Suspendisse ut elit in nisi cursus pretium.", isVisited: false),
        Cafe(name: "Banque du Sang de l'Hôpital Sahloul ", type: "Sousse", location: " Hôpital Sahloul de Sousse 4000 Sousse ", image: "5", phone: "73369411", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque quam augue, malesuada a bibendum at, luctus at velit. Sed ornare nibh sed nulla euismod, rutrum gravida metus pulvinar. Fusce vitae purus turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec sem urna, eleifend vel dolor et, dapibus vehicula metus. Donec facilisis tempus mi, quis dictum arcu. In tempus sapien purus. Maecenas sit amet tempor orci, ut condimentum urna. Suspendisse ut elit in nisi cursus pretium.", isVisited: false)
    ]

    // MARK:- View controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
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
        cell.locationLabel.text = cafes[indexPath.row].location
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
