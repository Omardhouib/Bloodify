//
//  ProfileViewcontroller.swift
//  Bloodify
//
//  Created by Omar Dhouib on 11/10/18.
//  Copyright © 2018 Omar Dhouib. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import UserNotifications

class ProfileViewcontroller: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource, TableViewnew{
  
    let URL_updatepoints_Insert = "http://"+Ipaddress.IPADDRESS+"/updatepoints/"
    let URL_updatedonorsnumbers_Insert = "http://"+Ipaddress.IPADDRESS+"/updatedonorsnumber/"
    let URL_Updatedonate_Insert = "http://"+Ipaddress.IPADDRESS+"/updateetat/"
    
   required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        tabBarItem = UITabBarItem(title: "", image: UIImage(named: "2202250-32"), tag: 5)
    }
    
    let imagePicker = UIImagePickerController()
    var data: [JSON] = []
    var data1: [JSON] = []
    var data2: [JSON] = []
    var data3: [JSON] = []
    var postArray : NSArray = []
    var postArray1 : NSArray = []
    var postArray2 : NSArray = []
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var profileImageView: UIImageView!{
        didSet {
            profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
            // Styled image
            profileImageView.clipsToBounds = true
            profileImageView.layer.borderColor = UIColor.white.cgColor
            profileImageView.layer.borderWidth = 2
        }
    }
    @IBOutlet weak var nom: UILabel!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var pointsimage: UIImageView!
    func continueToHome() {
        performSegue(withIdentifier: "toHome", sender: self)}
    @IBAction func Logout(_ sender: UIButton) {
        //removing values from default
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
        //switching to login screen
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        self.navigationController?.pushViewController(loginViewController, animated: true)
        self.dismiss(animated: false, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
           UNUserNotificationCenter.current().delegate = self
        imagePicker.delegate = self
        //hiding back button
//       let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
//        navigationItem.leftBarButtonItem = backButton
        let defaultValues = UserDefaults.standard
        let name = defaultValues.string(forKey: "nom")
        let prename = defaultValues.string(forKey: "prenom")
            nom.text = (name ?? "" ) + " " + (prename ?? "")
           }
    
    override func viewDidAppear(_ animated: Bool) {
        getactivNonConfrimé()
        getactivConfrimé()
        getLogoimage()
    }
    
    var picker_image : UIImage? {
        
        didSet {
            guard let image = picker_image else { return }
            self.profileImageView.image = image
        }
        
    }
    
    
    
    
    func createnotif(){
        let content = UNMutableNotificationContent()
        content.title = "Félicitaion"
        content.subtitle = ""
        
        
        content.body = "Vous avez gagné(e) 1 point de plus dans votre score! "
        content.sound = UNNotificationSound.default
        let triger = UNTimeIntervalNotificationTrigger(timeInterval: 3.0, repeats: false)
        let request = UNNotificationRequest(identifier: "identifier",
                                            content: content, trigger: triger)
        UNUserNotificationCenter.current().add(request){ (error) in
            print(error as Any )
            
        }
    }
    
    
    @IBAction func changeImage(_ sender: Any) {
        
        let sheet = UIAlertController(title: "Ajouter une photo", message: "Choisssez votre source", preferredStyle: .actionSheet)
        
        let actionSheetLibrary = UIAlertAction(title: "Photo library", style: .default) { (UIAlertAction) in
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let actionSheetCamera = UIAlertAction(title: "Camera", style: .default) { (UIAlertAction) in
            self.imagePicker.sourceType = .camera
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let actionSheetCancel = UIAlertAction(title: "Annuler", style: .cancel, handler: nil)
        sheet.addAction(actionSheetLibrary)
        sheet.addAction(actionSheetCamera)
        sheet.addAction(actionSheetCancel)
        self.present(sheet, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.picker_image = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.picker_image = originalImage
            
        }
        let imageData = self.picker_image!.jpegData(compressionQuality: 0.5)
        Alamofire.upload(multipartFormData: { (MultipartFormData) in
            MultipartFormData.append(imageData!, withName: "myImage", fileName: "image.jpeg", mimeType: "image/jpeg")
        }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, to:"http://"+Ipaddress.IPADDRESS+"/uploadprofilepic/"+UserDefaults.standard.string(forKey: "Id")!, method: .post, headers: nil) { (result: SessionManager.MultipartFormDataEncodingResult) in
            switch result {
            case .failure(let error):
                print(error)
            case . success(request: let upload, streamingFromDisk: _, streamFileURL: _):
                upload.uploadProgress(closure: { (progress) in
                    print(progress)
                }
                    
                )}
        }
        picker.dismiss(animated: true, completion: nil)
        
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       if (tableView == tableview){
       print("la taille du tableau : ",postArray1.count)
        return postArray1.count}
        else {
             print("la taille du tableau2 : ",postArray.count)
        return postArray.count
        }
     
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (tableView == tableview) {
            
            let cell = tableview.dequeueReusableCell(withIdentifier: "approuver", for: indexPath) as! ProfilenonconfTableViewCell
            print("hiiiiii",cell)
            _ = postArray1[indexPath.row] as! Dictionary<String,Any>
            //  cell1.userprenom.text = post["id_user"] as! String
            
            cell.nbpoches.text = self.data3[indexPath.row]["slots"].stringValue
            cell.grpsanguin.text = self.data3[indexPath.row]["grpsanguin"].stringValue
            cell.region.text = self.data3[indexPath.row]["region"].stringValue
            // cell.userprenom.text = self.data2[indexPath.row]["prenom"].stringValue
        return cell
        }
        else {
            let cell = tableView1.dequeueReusableCell(withIdentifier: "Profilcellapp", for: indexPath) as! ProfileTableViewCell
            print(cell)
            //let post = postArray[indexPath.row] as! Dictionary<String,Any>
            //cell.usernom.text = String(post["id_user"]) as! Int
            
            let nbpoches = self.data1[indexPath.row]["slots"].stringValue
            cell.nbpoches.text = nbpoches
            print("nbp",self.data1[indexPath.row]["slots"].stringValue)
            cell.grpsanguin.text = self.data1[indexPath.row]["grpsanguin"].stringValue
            cell.region.text = self.data1[indexPath.row]["region"].stringValue
            //  cell.usernom.text = self.data[indexPath.row]["prenom"].stringValue
            cell.cellDelegate = self
            cell.index = indexPath
            
            return cell
        }
    }
     
   
        
    
    
    func onClickCell(index: Int) {
        let post = postArray[index] as! Dictionary<String,Any>
        let defaultValues = UserDefaults.standard
        let id = defaultValues.integer(forKey: "Id")
        let idpost = self.data1[index]["Id"].intValue
        let iddonate = post["Id"] as! Int
        print("idpost",self.data1[index]["Id"].intValue)
        print("iddonate",post["Id"] as! Int)
        print("heloo",id)
        Alamofire.request(URL_updatepoints_Insert + String(id), method: .post)
        Alamofire.request(URL_updatedonorsnumbers_Insert + String(idpost), method: .post)
        Alamofire.request(URL_Updatedonate_Insert + String(iddonate), method: .post)
        createnotif()
        
    }
    
    func getactivNonConfrimé(){
        
        self.data = []
       self.data1 = []
        let defaultValues = UserDefaults.standard
        let id = defaultValues.integer(forKey: "Id")
        print(id)
        Alamofire.request("http://"+Ipaddress.IPADDRESS+"/afficherdonate/" + String(id) + "/" + String(0)).responseJSON{ response in
        
            _ = JSON(response.result.value!)
         //   print(responseJson[0]["id_user"].stringValue)
         //   print(responseJson[0]["Id"].stringValue)
            self.postArray = response.result.value as! NSArray
            for donate in self.postArray {
                let d = donate as! Dictionary<String,Any>
                self.data.append(JSON(d["user"] as! NSDictionary))
                self.data1.append(JSON(d["post"] as! NSDictionary))
            }
            self.tableView1.reloadData()
        }
        
    }
    func getactivConfrimé(){
    
        self.data2 = []
        self.data3 = []
        let defaultValues = UserDefaults.standard
        let id = defaultValues.integer(forKey: "Id")
        print(id)
        Alamofire.request("http://"+Ipaddress.IPADDRESS+"/afficherdonate/" + String(id) + "/" + String(1)).responseJSON{ response in
            _ = JSON(response.result.value!)
            self.postArray1 = response.result.value as! NSArray
            for donate in self.postArray1 {
                let d = donate  as! Dictionary<String,Any>
                self.data2.append(JSON(d["user"] as! NSDictionary))
                self.data3.append(JSON(d["post"] as! NSDictionary))
            }
            self.tableview.reloadData()
        }
    }
    
    func getLogoimage(){
        
        let defaultValues = UserDefaults.standard
        let id = defaultValues.integer(forKey: "Id")
        print(id)
        Alamofire.request("http://"+Ipaddress.IPADDRESS+"/affichuserr/" + String(id)).responseJSON{ response in
            let responseJson = JSON(response.result.value!)
            let pointsUser = responseJson[0]["points"].intValue
            let imagePath = responseJson[0]["photo"].stringValue
            print("image path: "+imagePath)
            self.profileImageView.af_setImage(withURL: URL(string: imagePath)!)
            self.points.text = String(pointsUser)
            if (pointsUser <= 20){
                self.pointsimage.image = UIImage(named: "class0")
            }
            else if (pointsUser > 20 && pointsUser <= 40){
                 self.pointsimage.image = UIImage(named: "class1")
            }
            else if (pointsUser > 40 && pointsUser <= 60){
                 self.pointsimage.image = UIImage(named: "class2")
            }
            else if (pointsUser > 60 && pointsUser <= 80){
                 self.pointsimage.image = UIImage(named: "class3")
            }
            else if (pointsUser > 80 && pointsUser <= 100) {
                 self.pointsimage.image = UIImage(named: "class4")
            }
            else if (pointsUser > 100) {
                 self.pointsimage.image = UIImage(named: "class4")
            }
        
               
                
            }
        }

    
    
    
  


}

extension ProfileViewcontroller : UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.sound,.badge])
    }
}
