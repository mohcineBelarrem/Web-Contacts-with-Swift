//
//  ContactsBook.swift
//  Web Contacts with Swift
//
//  Created by mohcine  on 7/23/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

import Foundation


class ContactsBook {
    
    var contactsList : [Contact]
    var me           : Contact!
    
    init(){
        
        self.contactsList = []
        
    }
    
    func description () -> String {
        
        var bookString = ""
        
        for contact in self.contactsList {
            
            bookString += "\r\n" + contact.description()
        }
        
        bookString += "\r\n" + self.me.description()
        
        return bookString
    }
    
}
