//
//  DBService.swift
//  Sleight
//
//  Created by C4Q on 4/13/18.
//  Copyright © 2018 DiegoBaca. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DBService: NSObject {
    private override init() {
        ref = Database.database().reference()
        gameroomsRef = ref.child("gamerooms")
        gametablesRef = ref.child("gametables")
        super.init()
    }
    static let manager: DBService = .init()
    
    var ref: DatabaseReference!
    var gameroomsRef: DatabaseReference!
    var gametablesRef: DatabaseReference!
}
