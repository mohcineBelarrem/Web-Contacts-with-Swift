//
//  SearchVC.swift
//  Web Contacts with Swift
//
//  Created by mohcine  on 7/24/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
 
    //Instance vars
    
    var tabVC : TabVC!
    
    //methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         self.tabVC = self.tabBarController as! TabVC
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
