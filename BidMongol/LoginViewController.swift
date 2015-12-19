//
//  LoginViewController.swift
//  BidMongol
//
//  Created by Naranbayar Tsogbadrakh on 12/17/15.
//  Copyright © 2015 Naranbayar Tsogbadrakh. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var rememberMe: UISwitch!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var locationBtn: UIButton!
    @IBOutlet weak var contactUsBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInAction(sender: AnyObject) {
       
        
        var userEmailAddress = userName.text
        userEmailAddress = userEmailAddress!.lowercaseString
        
        let userPassword = password.text
        
        PFUser.logInWithUsernameInBackground(userEmailAddress!, password:userPassword!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                dispatch_async(dispatch_get_main_queue()) {
                    
                     NSLog("success")
                    
                    //self.performSegueWithIdentifier("signInToNavigation", sender: self)
                }
            } else {
                
               NSLog("error")
            }
        }
        
        
    }
    
    
    
    @IBAction func forgotAction(sender: AnyObject) {
    }
    
    @IBAction func registerAction(sender: AnyObject) {
       
    }
    
    @IBAction func locationAction(sender: AnyObject) {
    }

    @IBAction func contactUsAction(sender: AnyObject) {
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
