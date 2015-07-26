//
//  TabVC.swift
//  Web Contacts with Swift
//
//  Created by mohcine  on 7/24/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

import UIKit


/* Normally we don't need a tabBarController beacause the storyboard gives the "behind scenes code" necessary to make
   the app work. But in our case we segue from the IVC to a controller which is an instance of the UITabBarController class
   so to pass the data to SearchVC and ContactsVC we must have an instance of TabVC.
   Besides since SVC and CVC are imbeded in a TVC they ancess the datat easily using the property self.tabBarController*/


class TabVC: UITabBarController,UITabBarControllerDelegate {
    
    
    //Instance vars
    
    //we keep track of the controller which holds the model so that we can give the SearchVC and ContactsVC
    //an access to Data
    var retriever : ContactsRetriver!
    
    
    //methods
    override func viewDidLoad() {

        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    


}
