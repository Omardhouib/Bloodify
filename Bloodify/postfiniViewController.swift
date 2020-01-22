//
//  postfiniViewController.swift
//  Bloodify
//
//  Created by Omar Dhouib on 1/14/19.
//  Copyright © 2019 Omar Dhouib. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage
class postfiniViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
     var postArray : NSArray = []
    var data: [JSON] = []
    var data1: [JSON] = []
var refreshControl: UIRefreshControl?
    @IBOutlet weak var tableviewpostfini: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        tableviewpostfini.reloadData()
        addRefreshControl()
        // Do any additional setup after loading the view.
    }
    
    func addRefreshControl() {
        
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = UIColor.red
        refreshControl?.addTarget(self, action: #selector(refreshList), for: .valueChanged)
        tableviewpostfini.addSubview(refreshControl!)
    }
    
    @objc func refreshList() {
  
        refreshControl?.endRefreshing()
        getData()
        tableviewpostfini.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
    }

 
    func getData(){
        
        self.data = []
        self.data1 = []
        Alamofire.request("http://"+Ipaddress.IPADDRESS+":3000/affichpostfini").responseJSON{ response in
            print(response.result.value)
            let responseJson = JSON(response.result.value)
            print(responseJson[0]["id_user"].stringValue)
            print(responseJson[0]["Id"].stringValue)
            self.postArray = response.result.value as! NSArray
            for index in 0...self.postArray.count - 1{
                let idUser : Int = responseJson[index]["id_user"].intValue
                let idPost : Int = responseJson[index]["Id"].intValue
                print(idPost)
                print(idUser)
                Alamofire.request("http://"+Ipaddress.IPADDRESS+":3000/affichuser/" + String(idUser)).responseJSON{ response in
                    self.data = self.data + JSON(response.result.value!).arrayValue
                    self.tableviewpostfini.reloadData()
                }
                Alamofire.request("http://"+Ipaddress.IPADDRESS+":3000/afficherpost/" + String(idPost)).responseJSON{ response in
                    self.data1 = self.data1 + JSON(response.result.value!).arrayValue
                    self.tableviewpostfini.reloadData()
                }
                
            }
        }
        
    }
}
