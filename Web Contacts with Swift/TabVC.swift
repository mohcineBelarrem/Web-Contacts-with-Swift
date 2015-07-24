//
//  TabVC.swift
//  Web Contacts with Swift
//
//  Created by mohcine  on 7/24/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

import UIKit

class TabVC: UITabBarController,UITabBarControllerDelegate {
    
    
    //Instance vars
    
    var retriever : ContactsRetriver!
    
    
    
    override func viewDidLoad() {

        super.viewDidLoad()

        self.retriever = ContactsRetriver()
        self.retriever.fetchData()
        
      //  println(self.viewControllers!.count)
     //    println("Tab bar")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    


}
