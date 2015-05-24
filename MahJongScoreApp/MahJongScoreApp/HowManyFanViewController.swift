//
//  HowManyFanViewController.swift
//  MahJongScoreApp
//
//  Created by Presenter on 16/5/15.
//  Copyright (c) 2015 Smokey Oolong Apps. All rights reserved.
//

import CoreData
import UIKit

class HowManyFanViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var gameId:NSManagedObjectID!
    var game:Game!
    var winnerPlayerId:NSManagedObjectID!
    @IBOutlet weak var fanPickerView: UIPickerView!
    var fans : [Int]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fans = [1,2,3,4,5,6,7,8,9,10,11,12]
        fanPickerView.dataSource = self
        fanPickerView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fans.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        let fan = String(self.fans[row])
        return fan;
    }
    
    @IBAction func save(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        self.game = managedContext.existingObjectWithID(gameId, error: nil) as! Game
        let winner = managedContext.existingObjectWithID(self.winnerPlayerId, error: nil) as! Player
        
        let round =  createEntity("Round") as! Round
        
        round.name = winner.name
        round.winner = winner
        round.fan = Int32(fans[fanPickerView.selectedRowInComponent(0)])
        round.game = self.game
        
        let resultEntityName = "Result"
        let winningResult = createEntity(resultEntityName) as! Result
        let winnings = calculateScore(round.fan)
        winningResult.winnings = winnings
        winningResult.player = winner
        winningResult.round = round;
        
        for player in [game.player1, game.player2, game.player3, game.player4]{
            
            if player.objectID != winner.objectID{
                let loserResult = createEntity(resultEntityName) as! Result
                loserResult.winnings = -1.0
                loserResult.player = player
                loserResult.round = round;
                round.loserResults.addObject(loserResult)
            }
        }
        
        round.winningResult = winningResult
        
        
        self.game.rounds.addObject(round)

        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func calculateScore(fan:Int32) -> Double {
        return pow(Double(2), Double(fan))
    }
    
    func createEntity(entityName:String) -> AnyObject{
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        return NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: managedContext)
    }

}
