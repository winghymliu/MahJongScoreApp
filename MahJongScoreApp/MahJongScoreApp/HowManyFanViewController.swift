//
//  HowManyFanViewController.swift
//  MahJongScoreApp
//
//  Created by Presenter on 16/5/15.
//  Copyright (c) 2015 Smokey Oolong Apps. All rights reserved.
//

import CoreData
import UIKit

class HowManyFanViewController: UIViewController {
    
    var gameId:NSManagedObjectID!
    var game:Game!
    var winnerPlayerId:NSManagedObjectID!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        self.game = managedContext.existingObjectWithID(gameId, error: nil) as! Game
        
        let round =  NSEntityDescription.insertNewObjectForEntityForName("Round", inManagedObjectContext: managedContext) as! Round
        let winner = managedContext.existingObjectWithID(self.winnerPlayerId, error: nil) as! Player
        
        round.name = winner.name
        round.game = self.game
        
        self.game.rounds.addObject(round)

        self.navigationController?.popToRootViewControllerAnimated(true)
    }

}
