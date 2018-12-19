//
//  ProfileDetailsViewController.swift
//  Bloodify
//
//  Created by Omar Dhouib on 12/18/18.
//  Copyright © 2018 Omar Dhouib. All rights reserved.
//

import UIKit
import Alamofire
class ProfileDetailsViewController: UIViewController {
     let URL_USER_MODIF = "http://192.168.70.129:8888/editprofile.php"
    @IBOutlet weak var nom: UILabel!
    @IBOutlet weak var prenom: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var tel: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var datedonation: UILabel!
    @IBOutlet weak var grpsanguin: UILabel!
    @IBOutlet weak var age: UILabel!
    
    @IBOutlet weak var textnom: UITextField!
    @IBOutlet weak var textprenom: UITextField!
    @IBOutlet weak var textemail: UITextField!
    @IBOutlet weak var texttel: UITextField!
    @IBOutlet weak var textregion: UITextField!
    @IBOutlet weak var textgrpsanguin: UITextField!
    @IBOutlet weak var textage: UITextField!
    @IBOutlet weak var textdatedonation: UITextField!
    
    @IBOutlet weak var Modif: UIButton!
    
    override func viewDidLoad() {
        
       
        super.viewDidLoad()
        let defaultValues = UserDefaults.standard
        let name = defaultValues.string(forKey: "nom")
        //setting the name to label
        nom.text = name
        let prename = defaultValues.string(forKey: "prenom")
        prenom.text = prename
        let EMail = defaultValues.string(forKey: "Email")
        email.text = EMail
        let Tel = defaultValues.string(forKey: "tel")
        tel.text = Tel
        let Region = defaultValues.string(forKey: "region")
        region.text = Region
        let Grpsanguin = defaultValues.string(forKey: "grpsanguin")
        grpsanguin.text = Grpsanguin
        let Age = defaultValues.string(forKey: "age")
        age.text = Age
        let Datedonation = defaultValues.string(forKey: "datedonation")
        datedonation.text = Datedonation
        // Do any additional setup after loading the view.
    }
    
    @IBAction func modifier(_ sender: UIButton) {
        if (textnom.text?.isEmpty)! || (textprenom.text?.isEmpty)! || (textemail.text?.isEmpty)! || (texttel.text?.isEmpty)! || (textgrpsanguin.text?.isEmpty)! || (textregion.text?.isEmpty)! || (textage.text?.isEmpty)! || (textdatedonation.text!.isEmpty)
        {
            displayMessage(userMessage: "Tous les champs sont obligatoires !")
            return
        }
        
        
       
        
        //View variables
        
        
        //creating parameters for the post request
        let parameters: Parameters = ["nom": textnom.text!,
                                      "prenom": textprenom.text!,
                                      "Email": textemail.text!,
                                      "tel": texttel.text!,"grpsanguin": textgrpsanguin.text!,"region": textregion.text!,"age": textage.text!,"datedonation": textdatedonation.text!,
                                      ]
        print ("jhjhjh")
        //Sending http post request
        Alamofire.request(URL_USER_MODIF, method: .post, parameters: parameters).responseJSON
            {
                
                response in
                //printing response
                print ("hello")
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    if(!(jsonData.value(forKey: "error") as! Bool)){
                     
                         let defaultValues = UserDefaults.standard
                        let id = defaultValues.string(forKey: "Email")
    
                    }else{
                    
                        self.displayMessage(userMessage: jsonData.value(forKey: "message") as! String)}
                }
                
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
}