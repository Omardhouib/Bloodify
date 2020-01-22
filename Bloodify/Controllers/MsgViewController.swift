//
//  MsgViewController.swift
//  Bloodify
//
//  Created by Omar Dhouib on 11/11/18.
//  Copyright © 2018 Omar Dhouib. All rights reserved.
//

import UIKit
import SwiftyJSON
import AlamofireImage
import Alamofire

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

class MsgViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
 
    
    
    @IBOutlet weak var tableviewmessage: UITableView!
    @IBOutlet weak var envoyer: UIButton!
    @IBOutlet weak var tableviewlist: UITableView!
    @IBOutlet weak var textmessage: UITextField!
    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var msgenvoyertableview: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    var postArray : NSArray = []
    var postArray1 : NSArray = []
    var postArray2 : NSArray = []
    var data: [JSON] = []
    var data1: [JSON] = []
    var data2: [JSON] = []
    var data3: [JSON] = []
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        tabBarItem = UITabBarItem(title: "", image: UIImage(named: "3741747-32"), tag: 2)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
      
        
       
        emailtext.delegate = self
        textmessage.delegate = self
  self.hideKeyboardWhenTappedAround()
      
    }
    override func viewDidAppear(_ animated: Bool) {
     
        getData()
        getData1()
        getData2()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView == tableviewlist){
            return postArray.count}
        else if(tableView == tableviewmessage){
            return postArray1.count
        }
        else {
            return postArray2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           if (tableView == tableviewlist){
            print("omomomo")
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "usermsg", for: indexPath) as! Message0TableViewCell
         _ = postArray[indexPath.row] as! Dictionary<String,Any>
                cell.nomuser.text = self.data[indexPath.row]["nom"].stringValue
            
                cell.emailuser.text = self.data[indexPath.row]["Email"].stringValue
                _ = self.data[indexPath.row]["photo"].stringValue
            cell.imageuser.af_setImage(withURL: URL(string: (self.data[indexPath.row]["photo"].stringValue))!)

        
            return cell
            
           }
           else if(tableView == tableviewmessage) {
            
                let cell2 = tableView.dequeueReusableCell(withIdentifier: "msg2", for: indexPath) as! Message2TableViewCell
                let post = postArray1[indexPath.row] as! Dictionary<String,Any>
            cell2.messageview.text = post["message"] as? String
            cell2.dateview.text = post["date"] as? String
            
                    _ = self.data1[indexPath.row]["photo"].stringValue
                    cell2.userimage.af_setImage(withURL: URL(string: self.data1[indexPath.row]["photo"].stringValue)!)
            
                
                  return cell2
            }
           else {
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "envoi", for: indexPath) as! Message1TableViewCell
            let post = postArray2[indexPath.row] as! Dictionary<String,Any>
            cell3.messageview.text = post["message"] as? String
            cell3.emailview.text = post["email_receiver"] as? String
            return cell3
        }
            
          
        
        
    }

let URL_USER_Insert = "http://"+Ipaddress.IPADDRESS+"/ajoutmeassage/"
    
    @IBAction func send(_ sender: UIButton) {
     
        print(emailtext.text!)
        print(textmessage.text!)
        let defaultValues = UserDefaults.standard
        let id = defaultValues.integer(forKey: "Id")
        Alamofire.request(URL_USER_Insert + String(id) + "/" + textmessage.text! + "/" + emailtext.text!, method: .post)
        
        print("hitleol")
        self.tableviewmessage.reloadData()
    }
    
    
    @IBAction func segmentedaction(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            msgenvoyertableview.isHidden = true
            tableviewmessage.isHidden = false
        case 1:
            msgenvoyertableview.isHidden = false
            tableviewmessage.isHidden = true
        default:
            break;
        }
    }
    
    
    func displayMessage(userMessage:String) -> Void {
        DispatchQueue.main.async
            {
                let alertController = UIAlertController(title: "Alerte", message: userMessage, preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                    // Code in this block will trigger when OK button tapped.
                    print("Ok button tapped")
                    DispatchQueue.main.async
                        {}
                }
             
                
                
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion:nil)
        }
    }
    
    func getData(){
        
       
        self.data = []
        let defaultValues = UserDefaults.standard
        let Id = defaultValues.integer(forKey: "Id")
        let email = defaultValues.string(forKey: "Email")
        
        Alamofire.request("http://"+Ipaddress.IPADDRESS+"/affichusermessage/" + String(Id) + "/" + email!).responseJSON{ response in
            print(response.result.value!)
            print("helooooooooooooo")
            _ = JSON(response.result.value!)
            //            print(responseJson[0]["id_user"].stringValue)
            //            print(responseJson[0]["Id"].stringValue)
            self.postArray = response.result.value as! NSArray
            for post in self.postArray {
                let p = post as! Dictionary<String,Any>
                self.data.append(JSON(p["user"] as! NSDictionary))
                
            }
        
        
       /* Alamofire.request("http://"+Ipaddress.IPADDRESS+":3000/affichusermessage/" + String(Id) + "/" + email!).responseJSON{ response in
            print(response.result.value!)
            let responseJson = JSON(response.result.value!)
            print(responseJson[0]["id_user"].stringValue)
            print(responseJson[0]["Id"].stringValue)
            self.postArray = response.result.value as! NSArray
            if self.postArray.count == 0 {
                print("fjfj")
            }
            else {
            for index in 0...self.postArray.count - 1{
                let idUser : Int = responseJson[index]["id_user"].intValue
                let idPost : Int = responseJson[index]["Id"].intValue
                print("message",idPost)
                print("useridmess",idUser)
     
                Alamofire.request("http://"+Ipaddress.IPADDRESS+":3000/affichuser/" + String(idUser)).responseJSON{ response in
                    self.data1 = self.data1 + JSON(response.result.value!).arrayValue
                    self.tableviewlist.reloadData()
                }
                }
    
            }*/
                  self.tableviewlist.reloadData()
        }
        
    }
    
    func getData1(){
        
        
        
        self.data1 = []
        let defaultValues = UserDefaults.standard
        let Id = defaultValues.integer(forKey: "Id")
        let email = defaultValues.string(forKey: "Email")
        
        Alamofire.request("http://"+Ipaddress.IPADDRESS+"/affichusermessage1/" + String(Id) + "/" + email!).responseJSON{ response in
            print(response.result.value!)
            _ = JSON(response.result.value!)
            //            print(responseJson[0]["id_user"].stringValue)
            //            print(responseJson[0]["Id"].stringValue)
            self.postArray1 = response.result.value as! NSArray
            for post in self.postArray1 {
                let p = post as! Dictionary<String,Any>
                self.data1.append(JSON(p["user"] as! NSDictionary))
               
            }
        
        
        /*
        Alamofire.request("http://"+Ipaddress.IPADDRESS+":3000/affichusermessage1/" + String(Id) + "/" + email!).responseJSON{ response in
            print(response.result.value!)
            let responseJson = JSON(response.result.value!)
            print(responseJson[0]["id_user"].stringValue)
            print(responseJson[0]["Id"].stringValue)
            self.postArray1 = response.result.value as! NSArray
            if self.postArray.count == 0 {
                print("fjfj")
            }
            else {
            for index in 0...self.postArray1.count - 1{
                let idUser : Int = responseJson[index]["id_user"].intValue
                let idPost : Int = responseJson[index]["Id"].intValue
                print("message",idPost)
                print("useridmess",idUser)
                
                Alamofire.request("http://"+Ipaddress.IPADDRESS+":3000/affichuser/" + String(idUser)).responseJSON{ response in
                    self.data2 = self.data2 + JSON(response.result.value!).arrayValue
                    self.tableviewmessage.reloadData()
                }
                
                }*/
            self.tableviewmessage.reloadData()
            }
        }
        
    
    
    func getData2(){
        
        
        self.data3 = []
        let defaultValues = UserDefaults.standard
        let Id = defaultValues.integer(forKey: "Id")
       
        
        Alamofire.request("http://"+Ipaddress.IPADDRESS+"/affichusermessage2/" + String(Id)).responseJSON{ response in
      
            _ = JSON(response.result.value!)
           
            self.msgenvoyertableview.reloadData()
            self.postArray2 = response.result.value as! NSArray
           
                
               self.msgenvoyertableview.reloadData()
                
                
            }
            }}
        



