//
//  ProfileViewcontroller.swift
//  Bloodify
//
//  Created by Omar Dhouib on 11/10/18.
//  Copyright © 2018 Omar Dhouib. All rights reserved.
//

import UIKit

class ProfileViewcontroller: UIViewController {
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        tabBarItem = UITabBarItem(title: "", image: UIImage(named: "1976053-32"), tag: 5)
    }
    
    @IBOutlet weak var nom: UILabel!
    
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
        
        //hiding back button
        /*let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton*/
        //getting user data from defaults
        let defaultValues = UserDefaults.standard
        if let name = defaultValues.string(forKey: "nom"){
            //setting the name to label
            nom.text = name
        }else{
            //send back to login view controller
        }
        

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
