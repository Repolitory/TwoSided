//
//  DBService+DebateTopic.swift
//  TwoSided
//
//  Created by C4Q on 5/9/18.
//  Copyright © 2018 DiegoBaca. All rights reserved.
//

import Foundation
import Firebase

extension DBService {
    
    public func createTopic(question: String,
                            category: Category, user: AppUser,
                            completion: @escaping (Result<DebateTopic, DBServiceError>) -> Void = {_ in },
                            test: Bool = false) {
        let newTopicID = debateTopicsRef.childByAutoId().key
        var updateData = [String: Any]()
        let topicData = ["question": question,
                         "creator": user.id,
                         "category": category.rawValue]
        
        print("\(test ? "/testDB" : "")/debateTopics/\(newTopicID)")
        print("\(test ? "/testDB" : "")/debateCategories/\(category.rawValue)/\(newTopicID)")
        
        updateData["\(test ? "/testDB" : "")/debateTopics/\(newTopicID)"] = topicData
        updateData["\(test ? "/testDB" : "")/debateCategories/\(category.rawValue)/\(newTopicID)"] = true
        self.ref.updateChildValues(updateData) { (error, dbRef) in
            if let error = error {
                print(error)
            } else {
                
            }
        }
    }
}


