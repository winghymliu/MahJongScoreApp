//
//  GameViewController.swift
//  MahJongScoreApp
//
//  Created by Presenter on 10/5/15.
//  Copyright (c) 2015 Smokey Oolong Apps. All rights reserved.
//

import UIKit
import CoreData


class GameTableViewController: UITableViewController {
    
    var gameId:NSManagedObjectID!
    var game:Game!
    var rounds:[Round] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName:"Game")
        game = managedContext.existingObjectWithID(gameId, error: nil) as! Game
        
        self.title = self.game.name
        rounds = game.rounds.allObjects as! [Round]
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rounds.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
        NSIndexPath) -> UITableViewCell {
        
        let cellId:String = "Cell"
        
        var cell : UITableViewCell  = tableView.dequeueReusableCellWithIdentifier(cellId) as! UITableViewCell
        let round = self.rounds[indexPath.row]
        let text = round.winner.name + " won " + String(round.fan) + " worth " + String(round.winningResult.winnings);
            cell.detailTextLabel?.text = text
        cell.textLabel!.text = round.winner.name
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true;
    }
    
    override func tableView(tableView: UITableView?, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath?) {
        if editingStyle == .Delete{
            if let tv = tableView {
                self.rounds.removeAtIndex(indexPath!.row)
                tv.deleteRowsAtIndexPaths( [indexPath!], withRowAnimation: .Fade)
            }
        } else if editingStyle == .Insert{
            
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row
        let round = self.rounds[row]
        //self.performSegueWithIdentifier("RoundDetails", sender: "Yo")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowWhoWon"
        {
            let svc = segue.destinationViewController as! WhoWonViewController
            svc.gameId = self.gameId
        } else if segue.identifier == "RoundDetails"{
            let svc = segue.destinationViewController as! RoundDetailsViewController
            if let roundsIndex = tableView.indexPathForSelectedRow()?.row {
                svc.round = self.rounds[roundsIndex]
            }
        }
    }

}