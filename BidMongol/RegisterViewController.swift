//
//  RegisterViewController.swift
//  BidMongol
//
//  Created by Naranbayar Tsogbadrakh on 12/17/15.
//  Copyright © 2015 Naranbayar Tsogbadrakh. All rights reserved.
//

import UIKit
import Parse

class RegisterViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phone1TextField: UITextField!
    @IBOutlet weak var phone2TextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmTextField: UITextField!

    @IBOutlet weak var StreetTextField: UITextField!
    @IBOutlet weak var SuiteTextField: UITextField!
    @IBOutlet weak var CityTextField: UITextField!
    @IBOutlet weak var StateTextField: UITextField!
    @IBOutlet weak var ZipTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userName.delegate = self
        self.passwordTextField.delegate = self
        self.firstNameTextField.delegate = self
        self.lastNameTextField.delegate = self
        self.phone1TextField.delegate = self
        self.phone2TextField.delegate = self
        self.emailTextField.delegate = self
        self.emailConfirmTextField.delegate = self
        self.StreetTextField.delegate = self
        self.SuiteTextField.delegate = self
        self.CityTextField.delegate = self
        self.StateTextField.delegate = self
        self.ZipTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        self.view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    @IBAction func registerAction(sender: AnyObject) {
        
        let newUser = PFUser()
        
        newUser.username = userName.text

        newUser.password = passwordTextField.text
        
        newUser["Fname"] = firstNameTextField.text
        newUser["Lname"] = lastNameTextField.text
        newUser["Phone1"] = phone1TextField.text
        newUser["Phone2"] = phone2TextField.text
        
        newUser["Street"] = StreetTextField.text
        newUser["Unit"] = SuiteTextField.text
        newUser["City"] = CityTextField.text
        newUser["State"] = StateTextField.text
        newUser["Zipcode"] = Int(ZipTextField.text!)
        
        if( emailTextField.text == emailConfirmTextField.text)
        {
        newUser["email"] = emailTextField.text
        }
        else  { print("Alert") }
        
        
        //3
        newUser.signUpInBackgroundWithBlock { succeeded, error in
            if (succeeded) {
                //The registration was successful, go to the wall
                
                // self.showErrorView(success)
                dispatch_async(dispatch_get_main_queue()) {
                    
                    
                  //  UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login")
                    
                    //var storyboard = UIStoryboard(name: "Main", bundle: nil)
                    
                   // self.performSegueWithIdentifier("Login", sender: nil)
                    
                   // self.performSegueWithIdentifier("signInToNavigation", sender: self)
                    
                    let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login")
                    self.presentViewController(viewController, animated: true, completion: nil)
                
                    
                    
                }
                
                
            } else if let error = error {
                //Something bad has occurred
            //self.showErrorView(error)
                
            }
        }
        
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
