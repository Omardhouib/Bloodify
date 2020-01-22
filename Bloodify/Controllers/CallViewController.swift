//
//  CallViewController.swift
//  Cafegram2EN
//
//  Created by Omar Dhouib on 11/25/18.
//  Copyright © 2018 Farukh IQBAL. All rights reserved.
//

import UIKit

class CallViewController: UIViewController {
var cafe = Cafe()
    override func viewDidLoad() {
        call()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func call(){
        let url:NSURL = NSURL(string: "tel://123456789")!
        
        UIApplication.shared.openURL(url as URL)
        print("hrloooo")
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
