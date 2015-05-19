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
        
        let gameId = saveGame()        
        
        var destination = segue.destinationViewController as! UINavigationController
        let svc = destination.topViewController as! GameTableViewController
        svc.gameId = gameId
    }
    
    func saveGame() -> NSManagedObjectID {
        
        let player1Entity = createEntity("Player") as! Player
        let player2Entity = createEntity("Player") as! Player
        let player3Entity = createEntity("Player") as! Player
        let player4Entity = createEntity("Player") as! Player
        player1Entity.name = player1TextField.text
        player2Entity.name = player2TextField.text
        player3Entity.name = player3TextField.text
        player4Entity.name = player4TextField.text
        
        let game = createEntity("Game") as! Game
        
        game.name = gameName
        game.rounds = NSMutableSet()
        
        let round = createEntity("Round") as! Round
        round.name = "HEY"
        game.rounds.addObject(round)
        game.player1 = player1Entity
        game.player2 = player2Entity
        game.player3 = player3Entity
        game.player4 = player4Entity

        return game.objectID
    }
    
    @IBOutlet weak var TestLabel: UILabel!

    func createEntity(entityName:String) -> AnyObject{
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        return NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: managedContext)
    }

}
