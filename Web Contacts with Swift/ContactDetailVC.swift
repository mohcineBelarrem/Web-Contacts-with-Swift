//
//  ContactDetailVC.swift
//  Web Contacts with Swift
//
//  Created by mohcine  on 7/23/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

import UIKit

class ContactDetailVC: UITableViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    //Instance vars
    
    var myName           : String!
    var contactToBeShown : Contact!
    var contactToBeShownImage : UIImage!
    
    var isMySelf  : Bool!
    
    
    //methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // println(self.contactToBeShown.description())
        
        
        self.isMySelf = self.myName == contactToBeShown.name.description()
        
        
        self.title! = self.isMySelf == true  ? "Me" : contactToBeShown.name.description()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 9
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 1
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cellReuseIdentifier : String!
        var cell : UITableViewCell!
        
        
        
        switch indexPath.section {
            
        case 0 :
            
            cellReuseIdentifier = "identityTableCell"
            cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath) as! UITableViewCell
            
            
            let nameLabel = cell.viewWithTag(200) as! UILabel
            
            nameLabel.text = self.contactToBeShown.name.description()
            
            let imageView = cell.viewWithTag(201) as! UIImageView
            
            imageView.image = self.contactToBeShownImage
            
            
        case 2 :
            
            cellReuseIdentifier = "addressTableCell"
            cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath) as! UITableViewCell
            
            let addressLabel = cell.viewWithTag(202) as! UILabel
            
            addressLabel.numberOfLines = 0
            
            addressLabel.text = self.contactToBeShown.location.description()
            
            
        case 1,3,4,5,6,7,8:
            
            cellReuseIdentifier = "normalTableCell"
            cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath) as! UITableViewCell
            
            let infoLabel = cell.viewWithTag(203) as! UILabel
            
            var contactToBeShowArray = ["",self.contactToBeShown.gender,"",self.contactToBeShown.email,self.contactToBeShown.cell,self.contactToBeShown.phone,
                                        self.contactToBeShown.ssn,self.contactToBeShown.username,self.contactToBeShown.password]
            
            
            if self.isMySelf == false {
                
                contactToBeShowArray[6] = "**************"
                //contactToBeShowArray[7] = "**************"
                contactToBeShowArray[8] = "**************"
            }
            
            infoLabel.numberOfLines = 0
            
            infoLabel.text = contactToBeShowArray[indexPath.section]
            
        default:
            break
            
        }
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var headerTitle = ""
        
        switch section {
            
        case 0 :
            headerTitle = "Identity"
        case 1 :
            headerTitle = "gender"
        case 2 :
            headerTitle = "Address"
        case 3 :
            headerTitle = "email"
        case 4 :
            headerTitle = "cell"
        case 5 :
            headerTitle = "phone"
        case 6 :
            headerTitle = "Social Security Number"
        case 7 :
            headerTitle = "username"
        case 8 :
            headerTitle = "password"
            
        default:
            
            headerTitle = ""
        }
        
        return headerTitle
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.section==0 {
            
            return  150.0
            
        } else if indexPath.section == 2 {
            
            return 130.0
        } else {
            
            return 60.0
        }
        
        
    }
    
    
}
