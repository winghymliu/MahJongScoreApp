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
    
    var gameName:String!
    var rounds:[Round] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName:"Game")
        let fetchedGames =
        managedContext.executeFetchRequest(fetchRequest, error : nil) as! [Game]
        
        let games = fetchedGames.filter {$0.name == self.gameName}
        let game = games[0]
        
        self.title = self.gameName
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
        
        cell.textLabel!.text = self.rounds[indexPath.row].name as String
       
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
    
}