//
//  Player.swift
//  MahJongScoreApp
//
//  Created by Presenter on 17/5/15.
//  Copyright (c) 2015 Smokey Oolong Apps. All rights reserved.
//

import Foundation
import CoreData

class Player: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var games: Game

}
