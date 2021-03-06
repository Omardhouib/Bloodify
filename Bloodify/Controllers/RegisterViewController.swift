//
//  RegisterViewController.swift
//  Bloodify
//
//  Created by Omar Dhouib on 11/9/18.
//  Copyright © 2018 Omar Dhouib. All rights reserved.
//

import UIKit
import Alamofire
class RegisterViewController: UIViewController {

    @IBOutlet weak var nom: UITextField!
    @IBOutlet weak var prenom: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var tel: UITextField!
    @IBOutlet weak var grpsanguin: UITextField!
    @IBOutlet weak var region: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var datedonation: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func signup(_ sender: UIButton) {
        if (nom.text?.isEmpty)! || (prenom.text?.isEmpty)! || (Email.text?.isEmpty)! || (tel.text?.isEmpty)! || (grpsanguin.text?.isEmpty)! || (region.text?.isEmpty)! || (age.text?.isEmpty)! || (Password.text?.isEmpty)! || (datedonation.text!.isEmpty)
        {
            displayMessage(userMessage: "Tous les champs sont obligatoires !")
            return
        }
        
     print("hiiiiiiiiiiiiiiiiiiii")
        
        //Defined a constant that holds the URL for our web service
        let URL_USER_REGISTER = "http://"+Ipaddress.phpIpAdress+"/register.php"
        
        //View variables
       
            
            //creating parameters for the post request
            let parameters: Parameters = ["nom": nom.text!,
                                         "prenom": prenom.text!,
                                         "Email": Email.text!,
                                         "tel": tel.text!,"region": region.text!,"grpsanguin": grpsanguin.text!,"age": age.text!,"datedonation": datedonation.text!,"password": Password.text!,
                                         ]
            print ("jhjhjh")
            //Sending http post request
            Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
                {
                    response in
                    //printing response
                    print(response)
                    
                    //getting the json value from the server
                    if let result = response.result.value {
                        
                        //converting it as NSDictionary
                        _ = result as! NSDictionary
                        
                        
                     
                    
            }
            
        }
        
       
       
       
        
        
    }
    
    
    
    
    
    @IBAction func connecter(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
