//
//  ViewController.swift
//  Web Contacts with Swift
//
//  Created by mohcine  on 7/23/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

import UIKit

class MasterController: UIViewController {
    
    
    var retriever : ContactsRetriver!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        retriever = ContactsRetriver()
        
        retriever.fetchData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

