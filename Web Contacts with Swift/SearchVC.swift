//
//  SearchVC.swift
//  Web Contacts with Swift
//
//  Created by mohcine  on 7/24/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

import UIKit


/* The class responsible for the local search Engine
   Inspired from
   http://www.ioscreator.com/tutorials/add-search-table-view-tutorial-ios8-swift
*/

class SearchVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating {
 
    //Instance vars
    
    var tabVC : TabVC!
    var allContacts = [Contact]()
    var filtredContacts = [Contact]()
    var resultSearchController = UISearchController()
    
    
    //outlets
    @IBOutlet var tableView: UITableView!
    
    //methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         self.tabVC = self.tabBarController as! TabVC
        
         //first thing we do is fill allContacts with all contacts available in the book so 
         //that we can use it as a base for our search
         self.allContacts.append(self.tabVC.retriever.book.me)
         self.allContacts += self.tabVC.retriever.book.contactsList
        
        
        self.resultSearchController = ({
            
            //This part inits the searchController and creates the searchBar programmaticaly
            
            let controller = UISearchController(searchResultsController: nil)
            
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            
            controller.searchBar.sizeToFit()
            
            controller.searchBar.placeholder = "Search for Contacts"
            
            self.tableView.tableHeaderView = controller.searchBar
            
            
            //just for asthetics but it's worth it
            controller.searchBar.layer.borderWidth = 1
            controller.searchBar.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 205/255, alpha: 1).CGColor
            controller.searchBar.returnKeyType = UIReturnKeyType.Done
            
            
            return controller
        })()
        
        
        self.tableView.reloadData()
        
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        //In case the user touched a blank area of the screen we should hide the keyboard
        self.view.endEditing(true)
    }
    
    //tableView Data source protocols
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        //height of a cell
        return 150.0
    }
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (self.resultSearchController.active) {
            
            //case the user is searching we display the results according to his query
            return self.filtredContacts.count
        }
        else {
            //case he's not we display all the result
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
        
        //label to display the contact's description
        cell.textLabel!.text = contactToBeDisplayed.description()
        cell.textLabel!.numberOfLines = 0
        
        //imageView to disply the contact's image
        cell.imageView!.image = self.tabVC.retriever.fetchContactImage(contactToBeDisplayed)
        cell.imageView!.layer.cornerRadius = 35
        cell.imageView!.clipsToBounds = true
        
        return cell
    }
    
    //SearchUpdating deleagte protocols
    
    func updateSearchResultsForSearchController(searchController: UISearchController){
        
        //method triggered everytime the user changes the content of the searchController's searchBar
        
        self.filtredContacts.removeAll(keepCapacity: false)
        
        self.filtredContacts = self.allContacts.filter(
        
        //closure header (params) -+ (return type) in
            
        { (comparedContact : Contact) -> Bool in
        
        //closure body
        let query = searchController.searchBar.text
        let name  = comparedContact.description()
            
        //closure return
        let resultRange = name.rangeOfString(query, options: NSStringCompareOptions.CaseInsensitiveSearch)
            
            return  resultRange != nil
        
        })
        
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// TODO: make the search Algorithm with NSPredicated
// let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text)
// let array = (self.allContacts as NSArray).filteredArrayUsingPredicate(searchPredicate)
//  self.filtredContacts = array as! [Contact]

