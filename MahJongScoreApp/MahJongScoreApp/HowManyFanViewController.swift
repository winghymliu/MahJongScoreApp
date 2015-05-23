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
        round.fan = fans[fanPickerView.selectedRowInComponent(0)]
        round.game = self.game
        
        let winningResult1 = createEntity("Result") as! Result
        let score = calculateScore(round.fan)
        winningResult1.winnings = score
        winningResult1.player = winner
        winningResult1.round = round;
        
        round.winningResult = winningResult1
        
        self.game.rounds.addObject(round)

        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func calculateScore(fan:Int) -> Int32 {
        return Int32(pow(Double(2), Double(fan)))
    }
    
    func createEntity(entityName:String) -> AnyObject{
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        return NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: managedContext)
    }

}
