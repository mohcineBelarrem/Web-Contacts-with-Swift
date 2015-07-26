//
//  ContactsRetriver.swift
//  Web Contacts with Swift
//
//  Created by mohcine  on 7/23/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

import UIKit
import Foundation


/* This is the controller responsible for fetching data from the web and storing it into the model */


class ContactsRetriver {
    
    //Instance variables...
    
    var book : ContactsBook
    var couldLoadData = false
    
    //Constructor...
    
    init() {
        
        self.book = ContactsBook()
    }
    
    //methods..
    
    func fetchData()  {
        
        //method to fetch JSON data and store it into the model
        //Inspired from
        //http://www.learnswift.io/blog/2014/7/30/parsing-json-in-swift
        
        var stringURL = "http://www.storage42.com/contacts.json"
        
        var url = NSURL(string: stringURL)
        
        if let contactsData = NSData(contentsOfURL: url!) {
            
            if let allContacts: NSDictionary = NSJSONSerialization.JSONObjectWithData(contactsData, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary {
                
                //Here we are sure that we loaded the data from internet so we can store it into the model
                
                var meDictionary = allContacts["me"] as! NSDictionary
                
                self.book.me = Contact(contact: meDictionary)
                
                //I could have
                var otherContacts = allContacts["contacts"] as! [NSDictionary]
                
                for contactDictionary in otherContacts {
                    
                    let contactObject = Contact(contact : contactDictionary)
                    
                    self.book.contactsList.append(contactObject)
                    
                }
                
                //TODO: save data in a file for offline mode
                
                //Important variable it tells us if everything went good, we're gonna need this piece of information later in the InitialVC
                self.couldLoadData = true
            }
            
            //TODO: check for a local file for data in case of an offline mode
            
        } else {
            
            //In case couldn't load data we show it to the user
            
            var alertView = UIAlertView(title: "No data", message: "Data couldn't be loaded, Please check your internet connection.", delegate: nil, cancelButtonTitle: "Ok")
            
            alertView.show()
            
        }
        
    }
    
    func fetchContactImage(contact : Contact) -> UIImage {
        
            //This method takes a contact and gives you his image it dosen't download it.
            //TODO : add a download photo method for offline mode and to speed the photo loading process. ASAP
        
            let stringURL = contact.picture.thumbnail
        
            let url = NSURL(string: stringURL)
        
            let imageData = NSData(contentsOfURL: url!)
            
            let image = UIImage(data: imageData!)
            
            return image!
    
    }
    
    
}
