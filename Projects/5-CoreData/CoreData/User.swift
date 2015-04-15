//
//  User.swift
//  CoreData
//
//  Created by Suleyman Calik on 15/04/15.
//  Copyright (c) 2015 BAU. All rights reserved.
//

import Foundation
import CoreData

class User: NSManagedObject {

    @NSManaged var username: String
    @NSManaged var password: String

}
