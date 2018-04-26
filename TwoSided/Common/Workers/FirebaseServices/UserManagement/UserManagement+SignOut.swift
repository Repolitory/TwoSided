//
//  UserManagement+SignOut.swift
//  Sleight
//
//  Created by C4Q on 4/17/18.
//  Copyright © 2018 DiegoBaca. All rights reserved.
//

import Foundation
import FirebaseAuth

enum UserSignOutError: UserManagementErrorEnum, Error {
    case userNotCurrentlySignedIn
    case couldNotSignOut(rawError: Error)

    case unknownError
}

extension UserManagement {
    
    public func signOut(completion: @escaping (Result<User, UserSignOutError>) -> Void) {
        guard let user = Auth.auth().currentUser else {
            completion(.failure(error: .userNotCurrentlySignedIn))
            return
        }
        do {
            try Auth.auth().signOut()
            completion(.success(value: user))
        } catch {
            completion(.failure(error: .couldNotSignOut(rawError: error)))
        }
    }
    
}

