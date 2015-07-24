//
//  ViewController.swift
//  Web Contacts with Swift
//
//  Created by mohcine  on 7/23/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

import UIKit

class InitialVC : UIViewController {
    
    
    // instance Vars...
    
    @IBOutlet var usernameField: UITextField!
    
    @IBOutlet var passwordField: UITextField!
    
    //methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
    }
    
    @IBAction func login(sender: AnyObject) {
        
        self.usernameField.resignFirstResponder()
        self.passwordField.resignFirstResponder()
        
        
        if  self.usernameField.text == "test" && self.passwordField.text == "test" {
            
            
        } else {
         
       //     var alertView = UIAlertView(title: "Login error", message: "Wrong username or password", delegate: nil, cancelButtonTitle: "Ok")
            
       //     alertView.show()
       
        }
        
        
        self.performSegueWithIdentifier("loginSegue", sender: self)
        
    }
    
}

