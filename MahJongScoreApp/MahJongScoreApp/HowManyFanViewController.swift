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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var winner:String!
    
    @IBAction func save(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let round =  NSEntityDescription.insertNewObjectForEntityForName("Round", inManagedObjectContext: managedContext) as! Round
        
        let winnerName = winner
        round.name = winnerName
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
