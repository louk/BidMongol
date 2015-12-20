//
//  DriverViewController.swift
//  BidMongol
//
//  Created by Naranbayar Tsogbadrakh on 12/17/15.
//  Copyright © 2015 Naranbayar Tsogbadrakh. All rights reserved.
//

import UIKit
import Parse

class DriverViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var searchTableView: UISearchBar!
    @IBOutlet weak var userTableView: UITableView!
    
    var userListArray:NSMutableArray? = NSMutableArray()
    
    var items: [PFObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userTableView.delegate = self
        self.userTableView.dataSource = self
        
        self.getUserList()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int)-> Int {

        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        let firstName : UILabel = cell.viewWithTag(1) as! UILabel
        let zipCode : UILabel = cell.viewWithTag(2) as! UILabel
        
        let object:PFObject = self.items[indexPath.row]
        

        if let usernameTxt = object.objectForKey("Fname") as? String {
            firstName.text = usernameTxt
        }
        else {
            zipCode.text = "No value"
        }
        

        if let zipcodeTxt = object.objectForKey("Zipcode") as? Int {
            zipCode.text = String(zipcodeTxt)
        }
        else {
            zipCode.text = "No value"
        }
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let selectedItem:PFObject = self.items[indexPath.row]
        
    }
    
    
    
    
    func getUserList(){
   
        let query:PFQuery=PFQuery(className: "_User");
        
            
        query.findObjectsInBackgroundWithBlock {
            (objects:[PFObject]?, error:NSError?) -> Void in
            if !(error != nil) {
                for(var i=0;i<objects!.count;i++){
                    let object=objects![i] ;
                    
                    self.items.append(object)
                }
                
                print(self.items)
                
                self.userTableView.reloadData()
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
