//
//  Game.swift
//  MahJongScoreApp
//
//  Created by Presenter on 17/5/15.
//  Copyright (c) 2015 Smokey Oolong Apps. All rights reserved.
//

import Foundation
import CoreData

class Game: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var player1: Player
    @NSManaged var rounds: NSMutableSet
    @NSManaged var player2: Player
    @NSManaged var player3: Player
    @NSManaged var player4: Player

}
