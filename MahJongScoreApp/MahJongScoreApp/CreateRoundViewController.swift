//
//  CreateRoundViewController.swift
//  MahJongScoreApp
//
//  Created by Presenter on 10/5/15.
//  Copyright (c) 2015 Smokey Oolong Apps. All rights reserved.
//

import UIKit
import CoreData

class CreateRoundViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var winner: UITextField!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    @IBAction func save(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
        let managedContext = appDelegate.managedObjectContext!
        
        let round =  NSEntityDescription.insertNewObjectForEntityForName("Round", inManagedObjectContext: managedContext) as! Round
        
        let winnerName = winner.text
        round.name = winnerName
        
     self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
}