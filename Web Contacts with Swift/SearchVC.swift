//
//  SearchVC.swift
//  Web Contacts with Swift
//
//  Created by mohcine  on 7/24/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

import UIKit

class SearchVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating {
 
    //Instance vars
    
    var tabVC : TabVC!
    
    @IBOutlet var tableView: UITableView!
    
    
    var allContacts = [Contact]()
    var filtredContacts = [Contact]()
    var resultSearchController = UISearchController()
    
    //methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         self.tabVC = self.tabBarController as! TabVC
        
         self.allContacts.append(self.tabVC.retriever.book.me)
        
         self.allContacts += self.tabVC.retriever.book.contactsList
        
        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            
            controller.searchBar.sizeToFit()
            
            controller.searchBar.placeholder = "Search for Contacts"
            
            //li tazyine
            controller.searchBar.layer.borderWidth = 1
            controller.searchBar.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 205/255, alpha: 1).CGColor
            
            
            self.tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
        
        self.tableView.reloadData()
        
    }
 
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // 1
        // Return the number of sections.
        return 1
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150.0
    }
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 2
        if (self.resultSearchController.active) {
            return self.filtredContacts.count
        }
        else {
            return self.allContacts.count
        }
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("searchResultCell", forIndexPath: indexPath) as! UITableViewCell
        
        var contactToBeDisplayed : Contact!
        
        // 3
        if (self.resultSearchController.active) {
            
            contactToBeDisplayed = self.filtredContacts[indexPath.row]
        }
        else {
            contactToBeDisplayed = self.allContacts[indexPath.row]
        }
        
        cell.textLabel!.text = contactToBeDisplayed.description()
        cell.textLabel!.numberOfLines = 0
       
        cell.imageView!.image = self.tabVC.retriever.fetchContactImage(contactToBeDisplayed)
        cell.imageView!.layer.cornerRadius = 35
        cell.imageView!.clipsToBounds = true
        
        return cell
    }
    
    
    
    func updateSearchResultsForSearchController(searchController: UISearchController){
        
        self.filtredContacts.removeAll(keepCapacity: false)
        
       // let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text)
        
       // let array = (self.allContacts as NSArray).filteredArrayUsingPredicate(searchPredicate)
        
      //  self.filtredContacts = array as! [Contact]
        
        self.filtredContacts = self.allContacts.filter({ (comparedContact : Contact) -> Bool in
        
        let query = searchController.searchBar.text
        let name  = comparedContact.description()
            
            return name.rangeOfString(query) != nil
        
        })
        
        
        self.tableView.reloadData()
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
