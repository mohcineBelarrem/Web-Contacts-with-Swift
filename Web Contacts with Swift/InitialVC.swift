//
//  ViewController.swift
//  Web Contacts with Swift
//
//  Created by mohcine  on 7/23/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

import UIKit


/*This is the VC responsible for the "HomeScreen" In which the user can enter a username and a password and then log in*/


class InitialVC : UIViewController {
    
    // instance Vars
    var retriever : ContactsRetriver!
    
    //Outlets
    @IBOutlet var usernameField: UITextField!
    
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    //methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //First thing we do we init the retriever
        self.retriever = ContactsRetriver()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        //Everytime the view appears we hide the loader cause it dosent make sense to have it from the start
        self.activityIndicator.hidden = true
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        //In case the user touched a blank area of the screen we should hide the keyboard
        self.view.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    //Passing data to the tabVC just after the segue is triggered
        
        if segue.identifier == "loginSegue" {
            
            let tabVC = segue.destinationViewController as! TabVC
            
            tabVC.retriever = self.retriever
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    //Actions
    @IBAction func login(sender: AnyObject) {
        
        self.usernameField.resignFirstResponder()
        self.passwordField.resignFirstResponder()
        
        if  self.usernameField.text == "test" && self.passwordField.text == "test" {
            
            //In case th user typed the right username and password we start fetching data
            
            self.activityIndicator.hidden = false
            
            self.retriever.fetchData()
            
            if( self.retriever.couldLoadData ) {
                
            //We only segue to The other scenes if we could load data
            //Cause with no data the other scenes would make the app crash 
            
            self.performSegueWithIdentifier("loginSegue", sender: self)
                
            } else {
                
                self.activityIndicator.hidden = true
            }
            
            
        } else {
            
            var alertView = UIAlertView(title: "Login error", message: "Wrong username or password", delegate: nil, cancelButtonTitle: "Ok")
            alertView.show()
            
        }
        
    }
    
    
    
}

