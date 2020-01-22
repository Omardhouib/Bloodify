//
//  viewpagerViewController.swift
//  Bloodify
//
//  Created by Omar Dhouib on 1/14/19.
//  Copyright © 2019 Omar Dhouib. All rights reserved.
//

import UIKit
import CarbonKit

class viewpagerViewController: UIViewController, CarbonTabSwipeNavigationDelegate {
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        let screenn = self.storyboard?.instantiateViewController(withIdentifier: "postfiniViewController") as! postfiniViewController
        return screenn
    }
    
   
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let items = ["Products", "About"]
        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self)
      
        // Do any additional setup after loading the view.
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
