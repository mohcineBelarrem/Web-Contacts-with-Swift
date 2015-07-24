//
//  ContactsRetriver.swift
//  Web Contacts with Swift
//
//  Created by mohcine  on 7/23/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

import UIKit
import Foundation

class ContactsRetriver {
    
    var book : ContactsBook
    
    var couldLoadData = false
    
    init() {
        
        self.book = ContactsBook()
    }
    
    func fetchData()  {
        
        //Inspired from
        //http://www.learnswift.io/blog/2014/7/30/parsing-json-in-swift
        
        var stringURL = "http://www.storage42.com/contacts.json"
        
        var url = NSURL(string: stringURL)
        
        var error : NSError?
        
        if let contactsData = NSData(contentsOfURL: url!) {
            
            if let allContacts: NSDictionary = NSJSONSerialization.JSONObjectWithData(contactsData, options: NSJSONReadingOptions.MutableContainers, error: &error) as? NSDictionary {
                
                //Here we are sure that we loaded the data from internet so we can store it into the model
                
                var meDictionary = allContacts["me"] as! NSDictionary
                
                self.book.me = Contact(contact: meDictionary)
                
                var otherContacts = allContacts["contacts"] as! [NSDictionary]
                
                for contactDictionary in otherContacts {
                    
                    let contactObject = Contact(contact : contactDictionary)
                    
                    self.book.contactsList.append(contactObject)
                    
                }
                
                // println(self.book.description())
                
                self.couldLoadData = true
            }
            
        } else {
            
            //couldn't load data
            
            var alertView = UIAlertView(title: "No data", message: "Data couldn't be loaded, Please check your internet connection.", delegate: nil, cancelButtonTitle: "Ok")
            
            alertView.show()
            
        }
        
    }
    
    func fetchContactImage(contact : Contact) -> UIImage {
        
            let stringURL = contact.picture.large
        
            let url = NSURL(string: stringURL)
        
            let imageData = NSData(contentsOfURL: url!)
            
            let image = UIImage(data: imageData!)
            
            return image!
    
    }
    
    
}
