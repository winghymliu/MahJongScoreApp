//
//  Result.swift
//  MahJongScoreApp
//
//  Created by Presenter on 23/5/15.
//  Copyright (c) 2015 Smokey Oolong Apps. All rights reserved.
//

import Foundation
import CoreData

class Result : NSManagedObject {
    @NSManaged var winnings : Double
    @NSManaged var player : Player
    @NSManaged var round : Round
}