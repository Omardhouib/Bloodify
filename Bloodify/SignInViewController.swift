//
//  SignInViewController.swift
//  Bloodify
//
//  Created by Omar Dhouib on 11/9/18.
//  Copyright © 2018 Omar Dhouib. All rights reserved.
//

import UIKit
import Alamofire

class SignInViewController: UIViewController {

    //The login script url make sure to write the ip instead of localhost
    //you can get the ip using ifconfig command in terminal
    let URL_USER_LOGIN = "http://192.168.70.129:8888/login.php"
    
    //the defaultvalues to store user data
    let defaultValues = UserDefaults.standard
    
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //hiding the navigation button
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //if user is already logged in switching to profile screen
       if defaultValues.string(forKey: "Email") != nil{
           self.continueToHome()
            
        }

        // Do any additional setup after loading the view.
    }
    
    func continueToHome() {
        performSegue(withIdentifier: "toHome", sender: self)
    }
    @IBAction func signin(_ sender: UIButton) {
        print("goood signin")
        
        
        let parameters: Parameters=[
            "Email":Email.text!,
            "password":password.text!
        ]
        
        //making a post request
        Alamofire.request(URL_USER_LOGIN, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    let jsonData = result as! NSDictionary
                    
                    //if there is no error
                    if(!(jsonData.value(forKey: "error") as! Bool)){
                        
                        //getting the user from response
                        let user = jsonData.value(forKey: "user") as! NSDictionary
                        
                        //getting user values
                        let userId = user.value(forKey: "Id") as! Int
                        let nom = user.value(forKey: "nom") as! String
                        let prenom = user.value(forKey: "prenom") as! String
                        let Email = user.value(forKey: "Email") as! String
                        let tel = user.value(forKey: "tel") as! String
                        let grpsanguin = user.value(forKey: "grpsanguin") as! String
                        let region = user.value(forKey: "region") as! String
                        let age = user.value(forKey: "age") as! String
                        let datedonation = user.value(forKey: "datedonation") as! String
                        let password = user.value(forKey: "password") as! String
                        
                        //saving user values to defaults
                        self.defaultValues.set(userId, forKey: "Id")
                        self.defaultValues.set(nom, forKey: "nom")
                        self.defaultValues.set(prenom, forKey: "prenom")
                        self.defaultValues.set(Email, forKey: "Email")
                        self.defaultValues.set(tel, forKey: "tel")
                        self.defaultValues.set(grpsanguin, forKey: "grpsanguin")
                        self.defaultValues.set(region, forKey: "region")
                        self.defaultValues.set(age, forKey: "age")
                        self.defaultValues.set(datedonation, forKey: "datedonation")
                        self.defaultValues.set(password, forKey: "password")
                        
                        //switching the screen
                    /*   let profileViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewcontroller") as! ProfileViewcontroller
                        self.navigationController?.pushViewController(profileViewController, animated: true)*/
                      self.continueToHome()
                        //self.dismiss(animated: false, completion: nil)
                    }else{
                        //error message in case of invalid credential
                        
                         self.displayMessage(userMessage: "Invalid username or password")
                    }
                }
        }
        
    }
    
    
    
    
    
    
    
    
    @IBAction func forgetpass(_ sender: Any) {
    }
    @IBAction func signup(_ sender: Any) {
        print ("signup is taped")
        
        let Register = self.storyboard?.instantiateViewController(withIdentifier: "signupViewController") as! signupViewController
        self.present(Register,animated: true)
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
