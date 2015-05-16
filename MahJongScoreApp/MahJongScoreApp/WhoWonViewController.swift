//
//  WhoWonViewController.swift
//  MahJongScoreApp
//
//  Created by Presenter on 16/5/15.
//  Copyright (c) 2015 Smokey Oolong Apps. All rights reserved.
//

import UIKit
import CoreData

class WhoWonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let fetchRequest = NSFetchRequest(entityName:"Game")
        
        let fetchError: NSError?
        
        let fetchedGames =
        managedContext.executeFetchRequest(fetchRequest, error : nil) as! [Game]
        
        let games = fetchedGames.filter {$0.name == "gameone"}
        let game = games[0]
        player1.text = game.player1.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var player1: UILabel!
    @IBOutlet weak var winner: UITextField!
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
