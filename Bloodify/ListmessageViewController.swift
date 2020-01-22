//
//  ListmessageViewController.swift
//  Bloodify
//
//  Created by Omar Dhouib on 1/15/19.
//  Copyright © 2019 Omar Dhouib. All rights reserved.
//

import UIKit
import SwiftyJSON
import AlamofireImage
import Alamofire
class ListmessageViewController: UIViewController {
  
    

    @IBOutlet weak var tableviewmessage: UITableView!
    @IBOutlet weak var nomuser: UILabel!
    @IBOutlet weak var Messagefield: UITextField!
    @IBOutlet weak var envoyer: UIButton!
    
    var postArray : NSArray = []
    var data: [JSON] = []
    var data1: [JSON] = []
    var data2: [JSON] = []
    var currentUser: String!
    override func viewDidLoad() {
        super.viewDidLoad()
print("hello",self.data2)
        getData()
        tableviewmessage.reloadData()
    }
    

 
    func getData(){
        
        self.data = []
        self.data1 = []
        self.data2 = []
        Alamofire.request("http://"+Ipaddress.IPADDRESS+":3000/affichusermessage").responseJSON{ response in
            print(response.result.value)
            let responseJson = JSON(response.result.value)
            print(responseJson[0]["id_user"].stringValue)
            print(responseJson[0]["Id"].stringValue)
            self.postArray = response.result.value as! NSArray
            for index in 0...self.postArray.count - 1{
                let idUser : Int = responseJson[index]["id_user"].intValue
                let idPost : Int = responseJson[index]["Id"].intValue
                print("message",idPost)
                print("useridmess",idUser)
                
                Alamofire.request("http://"+Ipaddress.IPADDRESS+":3000/affichuser/" + String(idUser)).responseJSON{ response in
                    self.data1 = self.data1 + JSON(response.result.value!).arrayValue
                    self.tableviewmessage.reloadData()
                }
                let defaultValues = UserDefaults.standard
                let Id = defaultValues.integer(forKey: "Id")
                Alamofire.request("http://"+Ipaddress.IPADDRESS+":3000/affichuser/" + String(Id)).responseJSON{ response in
                    self.data2 = self.data2 + JSON(response.result.value!).arrayValue
                    // print("data2",self.data2 + JSON(response.result.value!).arrayValue)
                    self.tableviewmessage.reloadData()
                }
                
            }
        }
        
    }
}
