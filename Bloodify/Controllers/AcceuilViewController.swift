//
//  AcceuilViewController.swift
//  Bloodify
//
//  Created by Omar Dhouib on 11/11/18.
//  Copyright © 2018 Omar Dhouib. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON
import CarbonKit
import UserNotifications



class AcceuilViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UITextViewDelegate, UITableViewDelegate, UITableViewDataSource, TableViewNew {
    
    
    
    

   
    
    
    @IBOutlet weak var segmentedcontrol: UISegmentedControl!
    @IBOutlet weak var tableviewpostfini: UITableView!
    let imagePicker = UIImagePickerController()
    
    let nbrpochesArray = ["1","2","3","4","5","6","7","8","9","10","Plus que 10"]
    let grpsangArray = ["AB+","AB-","A+","A-","B+","B-","O+","O-"]
    let regionArray = ["Ariana","Béja","Ben arous","Bizerte","Gabés","Gafsa","Jendouba","Kairouan","Kasserine","Kébili","Kef","Mahdia","La Manouba","Médenine","Monastir","Nabeul","Sfax","Sidi Bouzid","Siliana","Sousse","Tataouine","Tozeur","Tunis","Zaghouan"]
    var picker : UIPickerView!
    var activeTextField = 0
    var activeTF : UITextField!
    var activeValue = ""
    var auctionSeconds : Int?
    @IBOutlet weak var textbox1: UITextField!
    @IBOutlet weak var textbox2: UITextField!
    @IBOutlet weak var textbox3: UITextField!
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        tabBarItem = UITabBarItem(title: "", image: UIImage(named: "1976053-32"), tag: 1)
    }
 
    
   
    var refreshControl: UIRefreshControl?
    var data: [JSON] = []
    var data1: [JSON] = []
    var postArray1 : NSArray = []
    var data2: [JSON] = []
    var data3: [JSON] = []

    
    @IBOutlet weak var tableviewnonfini: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        //self.navigationController?.isNavigationBarHidden = true
        imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
     
        textbox1.delegate = self
        textbox2.delegate = self
        textbox3.delegate = self
        tableviewnonfini.tableFooterView = UIView.init(frame: .zero)
        tableviewnonfini.dataSource = self
        tableviewpostfini.tableFooterView = UIView.init(frame: .zero)
        tableviewpostfini.dataSource = self
        getData()
        tableviewnonfini.reloadData()
        getData1()
        tableviewpostfini.reloadData()
        
    }
 
    override func viewWillAppear(_ animated: Bool) {
        getData()
        getData1()
    }
    
 
  

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch activeTextField {
        case 1:
            return nbrpochesArray.count
        case 2:
            return grpsangArray.count
        case 3:
            return regionArray.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        // return correct content for picekr view
        switch activeTextField {
        case 1:
            return nbrpochesArray[row]
        case 2:
           return grpsangArray[row]
        case 3:
            return regionArray[row]
        default:
            return ""
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        // set currect active value based on picker view
        switch activeTextField {
        case 1:
            activeValue = nbrpochesArray[row]
        case 2:
            activeValue = grpsangArray[row]
        case 3:
            activeValue = regionArray[row]
            
        default:
            activeValue = ""
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        // set up correct active textField (no)
        switch textField {
        case textbox1:
            activeTextField = 1
            //productSubCategoryTextField.text = ""
        case textbox2:
            activeTextField = 2
        case textbox3:
            activeTextField = 3
        default:
            activeTextField = 0
        }
        
        // set active Text Field
        activeTF = textField
        
        self.pickUpValue(textField: textField)
        
    }
    
    func pickUpValue(textField: UITextField) {
        
        // create frame and size of picker view
        picker = UIPickerView(frame:CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.view.frame.size.width, height: 216)))
        
        // deletates
        picker.delegate = self
        picker.dataSource = self
        
        // if there is a value in current text field, try to find it existing list
        if let currentValue = textField.text {
            
            var row : Int?
            
            // look in correct array
            switch activeTextField {
            case 1:
                row = nbrpochesArray.index(of: currentValue)
            case 2:
                row = grpsangArray.index(of: currentValue)
            case 3:
                row = regionArray.index(of: currentValue)
                
            default:
                row = nil
            }
            
            // we got it, let's set select it
            if row != nil {
                picker.selectRow(row!, inComponent: 0, animated: true)
            }
        }
        
        picker.backgroundColor = UIColor.white
        textField.inputView = self.picker
        
        // toolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        //        toolBar.barTintColor = UIColor.darkGray
        toolBar.sizeToFit()
        
        // buttons for toolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClick))
        doneButton.tintColor = .black
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
        cancelButton.tintColor = .black
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(textField == textbox1){
            return false
        }
        if(textField == textbox2){
            return false
        }
        if(textField == textbox3){
            return false
        }
        
        return true
    }
    
    // done
    @objc func doneClick() {
        activeTF.text = activeValue
        activeTF.resignFirstResponder()
        
    }
    
    // cancel
    @objc func cancelClick() {
        activeTF.resignFirstResponder()
    }
    




    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("la taille du tableau : ",postArray.count)
        if (tableView == tableviewnonfini) {
             return postArray.count
        }
        else{
            return postArray1.count
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         if (tableView == tableviewnonfini) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AcceuilCell", for: indexPath) as! AcceuilTableViewCell
        
        let post = postArray[indexPath.row] as! Dictionary<String,Any>
        
        cell.region.text = post["region"] as? String
        cell.grpsanguin.text = post["grpsanguin"] as? String
        cell.nbrepoches.text = post["slots"] as? String
        cell.donorsnumber.text = String(post["donors_number"] as! Int)
    
            
            let prenom = self.data[indexPath.row]["prenom"].stringValue
            let nom = self.data[indexPath.row]["nom"].stringValue
            cell.nomuser.text = nom+" "+prenom
     let imagePath = self.data[indexPath.row]["photo"].stringValue
           print("image path: "+imagePath)
            cell.imageuser.af_setImage(withURL: URL(string: self.data[indexPath.row]["photo"].stringValue)!)
           // cell.imageuser.af_setImage(withURL: URL(string: self.data[indexPath.row]["profile_image_path"].stringValue)!)
            cell.cellDelegate = self
            cell.index = indexPath
       
        return cell
        }
          else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "postfinicell", for: indexPath) as! postfiniTableViewCell
            
            let post = postArray1[indexPath.row] as! Dictionary<String,Any>
            
            cell.region.text = post["region"] as? String
            cell.grpsanguin.text = post["grpsanguin"] as? String
            cell.nbpoches.text = post["slots"] as? String
            cell.donorsnumber.text = String(post["donors_number"] as! Int)
           
                let prenom = self.data2[indexPath.row]["prenom"].stringValue
                let nom = self.data2[indexPath.row]["nom"].stringValue
                cell.nomprenom.text = nom+" "+prenom
                let imagePath = self.data2[indexPath.row]["photo"].stringValue
                print("image path: "+imagePath)
                cell.imageuser.af_setImage(withURL: URL(string: self.data2[indexPath.row]["photo"].stringValue)!)
            return cell
            
        }
            
        }
    
    
    @IBAction func switchtable(_ sender: Any) {
        switch segmentedcontrol.selectedSegmentIndex {
        case 0:
            tableviewpostfini.isHidden = true
            tableviewnonfini.isHidden = false
        case 1:
            tableviewpostfini.isHidden = false
            tableviewnonfini.isHidden = true
        default:
            break;
        }
    }
    
    func onClickCell(index: Int) {
       
       
        let defaultValues = UserDefaults.standard
        let id = defaultValues.integer(forKey: "Id")
           let id_post = self.data1[index]["Id"].intValue
        Alamofire.request(URL_donate_Insert + String(id) + "/" + String(id_post), method: .post)
         displayMessage1(userMessage: "Veuillez vérifier vos activités non confirmés dans votre profil ")
    }

    var postArray : NSArray = []
 
    
  let URL_USER_Insert = "http://"+Ipaddress.IPADDRESS+"/ajouterPost/"
   let URL_donate_Insert = "http://"+Ipaddress.IPADDRESS+"/ajoutdonate/"
        
 
    
   
    
    @IBAction func Post(_ sender: UIButton) {
       if (textbox1.text?.isEmpty)! || (textbox2.text?.isEmpty)! || (textbox3.text!.isEmpty)
        {
            displayMessage(userMessage: "Tous les champs sont obligatoires !")
           return
        }
        
        
        let defaultValues = UserDefaults.standard
        let id = defaultValues.integer(forKey: "Id")
        let id_user = id
        let region = textbox3.text!
        let grpsanguin = textbox2.text!
        let slots = textbox1.text!
         Alamofire.request(URL_USER_Insert + String(id_user) + "/" + region + "/" + grpsanguin + "/" + slots, method: .post)
       
        print("after")
        print(textbox3.text!)
        print(textbox1.text!)
        print(textbox2.text!)
        print(id)
       
       
    }
    

    
    
    
 
    
    func displayMessage(userMessage:String) -> Void {
        DispatchQueue.main.async
            {
                let alertController = UIAlertController(title: "Alerte", message: userMessage, preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                    // Code in this block will trigger when OK button tapped.
                    
                    
                    UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
                    DispatchQueue.main.async
                        {}
                }
              

                alertController.addAction(OKAction)
              
                self.present(alertController, animated: true, completion:nil)
        }
    }
    
    func displayMessage1(userMessage:String) -> Void {
        DispatchQueue.main.async
            {
                let alertController = UIAlertController(title: "Alerte", message: userMessage, preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                    DispatchQueue.main.async
                        {}
                }
                
                
                alertController.addAction(OKAction)
                
                self.present(alertController, animated: true, completion:nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func getData(){
        
        self.data = []
        self.data1 = []
        Alamofire.request("http://"+Ipaddress.IPADDRESS+"/affichpost").responseJSON{ response in
            print(response.result.value!)
            _ = JSON(response.result.value!)
//            print(responseJson[0]["id_user"].stringValue)
//            print(responseJson[0]["Id"].stringValue)
            self.postArray = response.result.value as! NSArray
            for post in self.postArray {
                 let p = post as! Dictionary<String,Any>
                self.data.append(JSON(p["user"] as! NSDictionary))
                self.data1.append(JSON(p["post1"] as! NSDictionary))
            }
//            self.tableviewnonfini.reloadData()
//            if self.postArray.count == 0 {
//                print("fjfj")
//            }
//            else {
//           for index in 0...self.postArray.count - 1{
//                let idUser : Int = responseJson[index]["id_user"].intValue
//                let idPost : Int = responseJson[index]["Id"].intValue
//                print(idPost)
//                print(idUser)
//                Alamofire.request("http://"+Ipaddress.IPADDRESS+":3000/affichuser/" + String(idUser)).responseJSON{ response in
//                    self.data = self.data + JSON(response.result.value!).arrayValue
//                    self.tableviewnonfini.reloadData()
//                }
//                Alamofire.request("http://"+Ipaddress.IPADDRESS+":3000/afficherpost/" + String(idPost)).responseJSON{ response in
//                    self.data1 = self.data1 + JSON(response.result.value!).arrayValue
            
//                }
            self.tableviewnonfini.reloadData()
//                }
//           }
        }

}
    
    func getData1(){
        
        self.data2 = []
        self.data3 = []
        Alamofire.request("http://"+Ipaddress.IPADDRESS+"/affichpostfini").responseJSON{ response in
            print(response.result.value!)
            _ = JSON(response.result.value!)
            //            print(responseJson[0]["id_user"].stringValue)
            //            print(responseJson[0]["Id"].stringValue)
            self.postArray1 = response.result.value as! NSArray
            for post in self.postArray1 {
                let p = post as! Dictionary<String,Any>
                self.data2.append(JSON(p["user"] as! NSDictionary))
                self.data3.append(JSON(p["post1"] as! NSDictionary))
            }
        
     /*   self.data2 = []
        self.data3 = []
        Alamofire.request("http://"+Ipaddress.IPADDRESS+":3000/affichpostfini").responseJSON{ response in
            print(response.result.value)
            let responseJson = JSON(response.result.value)
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
                print(idPost)
                print(idUser)
                Alamofire.request("http://"+Ipaddress.IPADDRESS+":3000/affichuser/" + String(idUser)).responseJSON{ response in
                    self.data2 = self.data2 + JSON(response.result.value!).arrayValue
                    self.tableviewpostfini.reloadData()
                }
                Alamofire.request("http://"+Ipaddress.IPADDRESS+":3000/afficherpost/" + String(idPost)).responseJSON{ response in
                    self.data3 = self.data3 + JSON(response.result.value!).arrayValue
                    self.tableviewpostfini.reloadData()
                }
 
                }
        
        }*/
            self.tableviewpostfini.reloadData()

        }
        
    }

}
