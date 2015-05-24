//
//  RoundDetailsViewController.swift
//  MahJongScoreApp
//
//  Created by Presenter on 24/5/15.
//  Copyright (c) 2015 Smokey Oolong Apps. All rights reserved.
//

import UIKit

class RoundDetailsViewController: UIViewController {
    var round:Round!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        winnerUILabel.text = round.winner.name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var winnerUILabel: UILabel!
}
