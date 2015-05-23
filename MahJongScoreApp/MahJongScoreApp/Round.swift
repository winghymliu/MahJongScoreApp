//
//  Round.swift
//  MahJongScoreApp
//
//  Created by Presenter on 17/5/15.
//  Copyright (c) 2015 Smokey Oolong Apps. All rights reserved.
//

import Foundation
import CoreData

class Round: NSManagedObject {
    
    @NSManaged var name: String
    @NSManaged var game: Game
    @NSManaged var fan: Int

}
