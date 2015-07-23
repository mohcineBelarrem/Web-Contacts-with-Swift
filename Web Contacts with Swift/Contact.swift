//
//  Contacts.swift
//  Web Contacts with Swift
//
//  Created by mohcine  on 7/23/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

import Foundation


struct Name {
  
    var title : String
    var first : String
    var last  : String
    
    
    init (contactName : NSDictionary){
        
        self.title = contactName["title"] as! String
        self.first = contactName["first"] as! String
        self.last  = contactName["last"] as! String
        
    }
    
    func description () -> String {
        
        return self.title.capitalizedString + ". " + self.first + " " + self.last
    }
    
}
    
    
struct Location {
    
    var street : String
    var city   : String
    var state  : String
    var zip    : String
    
   
    
    init (contactLocation : NSDictionary){
        
        self.street = contactLocation["street"] as! String
        self.city = contactLocation["city"] as! String
        self.state  = contactLocation["state"] as! String
        self.zip  = contactLocation["zip"] as! String
        
    }
    
    func description () -> String {
        
        return self.street + " " + self.city + " " + self.state + " " + self.zip
    }
}


struct Picture {
    
    var large      : String
    var medium     : String
    var thumbnail  : String
    
    init (contactPicture : NSDictionary){
        
        self.large = contactPicture["large"] as! String
        self.medium = contactPicture["medium"] as! String
        self.thumbnail  = contactPicture["thumbnail"] as! String
        
    }
    
}

class Contact {
 
    var gender     : String
    var name       : Name
    var location   : Location
    var email      : String
    var username   : String
    var password   : String
    var phone      : String
    var cell       : String
    var ssn        : String
    var picture    : Picture
    
    
    init (contact : NSDictionary){
        
        self.gender = contact["gender"] as! String
        
        self.name = Name(contactName: contact["name"] as! NSDictionary)
        
        self.location = Location(contactLocation: contact["location"] as! NSDictionary)
        
        self.email = contact["email"] as! String
        
        self.username = contact["username"] as! String
        
        self.password = contact["password"] as! String
        
        self.phone = contact["phone"] as! String
        
        self.cell = contact["cell"] as! String
        
        self.ssn = contact["SSN"] as! String
        
        self.picture = Picture(contactPicture: contact["picture"] as! NSDictionary)
        
    }
    
    func description () -> String {
        
        return self.name.description() + " " + self.gender + " " + self.location.description() + " " + self.email + " " + self.phone + " " + self.cell
    }
    
}