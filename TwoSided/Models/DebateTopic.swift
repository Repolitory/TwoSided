//
//  DebateTopic.swift
//  TwoSided
//
//  Created by C4Q on 5/9/18.
//  Copyright © 2018 DiegoBaca. All rights reserved.
//

import Foundation

class DebateTopic {
    
    private(set) var question: String
    private(set) var creator: String
    private(set) var category: Category
    private var dateCreated = Date()
    
    init(question: String, creator: String, category: Category) {
        self.question = question
        self.category = category
        self.creator = creator
    }
    
    func deleteDebate(from creator: String) -> Bool {
        return false
    }
    
}
