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
    
   
    @IBOutlet weak var player1TextField: UITextField!
    @IBOutlet weak var player2TextField: UITextField!
    @IBOutlet weak var player3TextField: UITextField!
    @IBOutlet weak var player4TextField: UITextField!
    
    var gameName:String!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowGameTable"
        {
            saveGame()
        }
        
        var destination = segue.destinationViewController as! UINavigationController
        let svc = destination.topViewController as! GameTableViewController
        svc.gameName = gameName
    }
    
    func saveGame() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let player1Entity = NSEntityDescription.insertNewObjectForEntityForName("Player", inManagedObjectContext: managedContext) as! Player
        player1Entity.name = player1TextField.text
        
        let game = NSEntityDescription.insertNewObjectForEntityForName("Game", inManagedObjectContext: managedContext) as! Game
        
        game.name = gameName
        game.rounds = Set<Round>()
        game.player1 = player1Entity

    }
    
    @IBOutlet weak var TestLabel: UILabel!

    

}
