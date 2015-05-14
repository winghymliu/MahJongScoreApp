//
//  SelectPlayersViewController.swift
//  MahJongScoreApp
//
//  Created by Presenter on 14/5/15.
//  Copyright (c) 2015 Smokey Oolong Apps. All rights reserved.
//

import UIKit
import CoreData

class SelectPlayersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        TestLabel.text = gameName
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var gameName:String!
    
    @IBAction func saveGame(sender: AnyObject) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let game = NSEntityDescription.insertNewObjectForEntityForName("Game", inManagedObjectContext: managedContext) as! Game
        
        game.name = gameName

    }
    
    @IBOutlet weak var TestLabel: UILabel!

    

}
