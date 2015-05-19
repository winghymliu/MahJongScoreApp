//
//  HowTheyWonViewController.swift
//  MahJongScoreApp
//
//  Created by Presenter on 16/5/15.
//  Copyright (c) 2015 Smokey Oolong Apps. All rights reserved.
//

import UIKit
import CoreData

class HowTheyWonViewController: UIViewController {

    var winnerPlayerId:NSManagedObjectID!
    var gameId:NSManagedObjectID!
    var game:Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let svc = segue.destinationViewController as! HowManyFanViewController
        svc.winnerPlayerId = self.winnerPlayerId
        svc.gameId = self.gameId
    }

}
