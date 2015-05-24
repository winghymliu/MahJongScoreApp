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
        winnerUILabel.text = round.winner.name;
        winnerWinnings.text = round.winningResult.winnings.description
        let loserResults = Array(round.loserResults) as! [Result]
        loser1UILabel.text = loserResults[0].player.name
        loser2UILabel.text = loserResults[1].player.name
        loser3UILabel.text = loserResults[2].player.name
        
        loser1LossesUILabel.text = loserResults[0].winnings.description
        loser2LossesUILabel.text = loserResults[1].winnings.description
        loser3LossesUILabel.text = loserResults[2].winnings.description
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var winnerWinnings: UILabel!

    @IBOutlet weak var loser1LossesUILabel: UILabel!
    @IBOutlet weak var loser2LossesUILabel: UILabel!
    @IBOutlet weak var loser3LossesUILabel: UILabel!
    @IBOutlet weak var loser3UILabel: UILabel!
    @IBOutlet weak var loser2UILabel: UILabel!
    @IBOutlet weak var loser1UILabel: UILabel!
    @IBOutlet weak var winnerUILabel: UILabel!
}
