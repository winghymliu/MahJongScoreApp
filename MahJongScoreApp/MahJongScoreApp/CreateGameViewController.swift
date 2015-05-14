//
//  CreateSessionViewController.swift
//  MahJongScoreApp
//
//  Created by Presenter on 9/5/15.
//  Copyright (c) 2015 Smokey Oolong Apps. All rights reserved.
//

import UIKit


class CreateGameViewController: UIViewController {
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    @IBOutlet weak var SessionNameTextField: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {

            var svc = segue.destinationViewController as! SelectPlayersViewController;
            svc.gameName = SessionNameTextField.text

    }
}
