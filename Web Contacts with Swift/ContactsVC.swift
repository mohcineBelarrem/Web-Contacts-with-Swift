//
//  ContactsVC.swift
//  Web Contacts with Swift
//
//  Created by mohcine  on 7/23/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

import UIKit

let reuseIdentifier = "collectionCell"

class ContactsVC: UICollectionViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    //Instance vars
    
    var tabVC : TabVC!
    
    //methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        self.title! = "All contacts"
        
        self.tabVC = self.tabBarController as! TabVC
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "detailSegue" {
            
            let contactDetailVC = segue.destinationViewController as! ContactDetailVC
            let cell = sender as! UICollectionViewCell
            
            if let indexPath = self.collectionView!.indexPathForCell(cell) {
                
                var contactToBeShown : Contact!
                
                if indexPath.section == 0 {
                    
                    contactToBeShown = self.tabVC.retriever.book.me
                    
                } else {
                    
                    contactToBeShown = self.tabVC.retriever.book.contactsList[indexPath.row]
                    
                }
                
                contactDetailVC.contactToBeShown = contactToBeShown
                contactDetailVC.contactToBeShownImage = self.tabVC.retriever.fetchContactImage(contactToBeShown)
                contactDetailVC.myName = self.tabVC.retriever.book.me.name.description()
            }
        }
    }
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 2
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        
        if section == 0 {
            
            return 1
            
        } else {
            
            return self.tabVC.retriever.book.contactsList.count
        }
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! UICollectionViewCell
        
        var contactToBeShown : Contact!
        
        var titleLabel = cell.viewWithTag(100) as! UILabel
        
        var imageView  = cell.viewWithTag(101) as! UIImageView
        
        if indexPath.section == 0 {
            
            contactToBeShown = self.tabVC.retriever.book.me
            
        } else {
            
            contactToBeShown = self.tabVC.retriever.book.contactsList[indexPath.row]
            
        }
        
        titleLabel.text = contactToBeShown.name.description()
        
        imageView.image = self.tabVC.retriever.fetchContactImage(contactToBeShown)
        
        cell.layer.borderColor = UIColor.blueColor().CGColor
        
        cell.layer.borderWidth = 2
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        var headerView : UICollectionReusableView!
        
        headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "collectionHeader", forIndexPath: indexPath) as! UICollectionReusableView
        
        
        let headerLabel = UILabel(frame: CGRectMake(25, 10, 200, 25))
        
        headerLabel.font = UIFont.systemFontOfSize(25)
        
        let sectionTitle =  (indexPath.section == 0) ? "Me" : "Other Contacts"
        
        headerLabel.text = sectionTitle
        
        headerView.addSubview(headerLabel)
        
        
        
        return headerView
    }
    
    
}
