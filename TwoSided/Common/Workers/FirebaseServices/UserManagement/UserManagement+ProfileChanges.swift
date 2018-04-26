//
//  UserManagement+ProfileChanges.swift
//  Sleight
//
//  Created by C4Q on 4/17/18.
//  Copyright © 2018 DiegoBaca. All rights reserved.
//

import Foundation
import FirebaseAuth

enum UserProfileChangeError: Error, UserManagementErrorEnum {
    case noUser
    
    case otherError(rawError: Error)
    case unknownError
}

extension UserManagement {
    
    private func userChangeRequest() -> UserProfileChangeRequest? {
        guard let user = Auth.auth().currentUser else {
            return nil
        }
        return user.createProfileChangeRequest()
    }
    
    public func changeDisplayName(to displayName: String,
                                  completion: @escaping (Result<User, UserProfileChangeError>) -> Void) {
        guard let request = userChangeRequest() else {
            completion(.failure(error: .noUser))
            return
        }
        request.displayName = displayName
        request.commitChanges { (error) in
            if let error = error {
                completion(.failure(error: .otherError(rawError: error)))
            } else if let user = Auth.auth().currentUser {
                completion(.success(value: user))
            }
            else {
                completion(.failure(error: .noUser))
            }
        }
    }
    
    
}
