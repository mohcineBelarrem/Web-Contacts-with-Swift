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
    
    var retriever : ContactsRetriver!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    //methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.retriever = ContactsRetriver()
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
    
        self.activityIndicator.hidden = true
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
            
            self.activityIndicator.hidden = false
            
            self.retriever.fetchData()
            
            if( self.retriever.couldLoadData ) {
            
            self.performSegueWithIdentifier("loginSegue", sender: self)
                
            } else {
                
                self.activityIndicator.hidden = true
            }
            
            
        } else {
            
            var alertView = UIAlertView(title: "Login error", message: "Wrong username or password", delegate: nil, cancelButtonTitle: "Ok")
            alertView.show()
            
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "loginSegue" {
            
            let tabVC = segue.destinationViewController as! TabVC
            
            tabVC.retriever = self.retriever
            
        }
    }
    
    
    func startAnimating(){
        
        
        var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Light)) as UIVisualEffectView
        
        visualEffectView.frame = self.view.bounds
        
        self.view.addSubview(visualEffectView)
    }
    
    
}

