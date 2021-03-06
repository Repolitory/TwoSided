//
//  Person.swift
//  Menagerie
//
//  Created by C4Q on 4/19/18.
//  Copyright © 2018 DiegoBaca. All rights reserved.
//

import Foundation
import Firebase

enum AppUserError: Error {
    case success
    case failedToCreateTopic
}

struct AppUser {
    let id: String
    let displayName: String
    
    func createTopic(create: DebateTopic, completion: @escaping (Result<DebateTopic, AppUserError>) -> Void) {
        
        
    }
    
}


