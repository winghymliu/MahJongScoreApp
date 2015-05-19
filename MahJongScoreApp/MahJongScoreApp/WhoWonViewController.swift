//
//  WhoWonViewController.swift
//  MahJongScoreApp
//
//  Created by Presenter on 16/5/15.
//  Copyright (c) 2015 Smokey Oolong Apps. All rights reserved.
//

import UIKit
import CoreData

class WhoWonViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var gameId:NSManagedObjectID!
    var game:Game!
    var players:[Player]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let game = managedContext.existingObjectWithID(gameId, error: nil) as! Game
        
        players = [game.player1, game.player2, game.player3, game.player4]
        WhoWonPicker.dataSource = self
        WhoWonPicker.delegate = self
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return players.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return players[row].name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var WhoWonPicker: UIPickerView!
    @IBOutlet weak var winner: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let svc = segue.destinationViewController as! HowTheyWonViewController
        svc.gameId = self.gameId
        svc.winnerPlayerId = players[WhoWonPicker.selectedRowInComponent(0)].objectID
    }


}
