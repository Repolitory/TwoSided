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
        debateTopicsRef = ref.child("debateTopics")
        debateCategoriesRef = ref.child("debateCategories")
        super.init()
    }
    static let manager: DBService = .init()
    
    var ref: DatabaseReference!
    var debateTopicsRef: DatabaseReference!
    var debateCategoriesRef: DatabaseReference!
}
