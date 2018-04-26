//
//  UserManagement+SignIn.swift
//  Sleight
//
//  Created by C4Q on 4/16/18.
//  Copyright © 2018 DiegoBaca. All rights reserved.
//

import Foundation
import FirebaseAuth
/*
 Possible error codes:
 
 + `FIRAuthErrorCodeOperationNotAllowed` - Indicates that email and password
 accounts are not enabled. Enable them in the Auth section of the
 Firebase console.
 + `FIRAuthErrorCodeUserDisabled` - Indicates the user's account is disabled.
 + `FIRAuthErrorCodeWrongPassword` - Indicates the user attempted
 sign in with an incorrect password.
 + `FIRAuthErrorCodeInvalidEmail` - Indicates the email address is malformed.
 */
enum UserSignInError: Error, UserManagementErrorEnum {
    case emailSignInNotAllowed
    case userDisabled
    case wrongPassword
    case invalidEmail
    
    case otherError(rawError: Error)
    case unknownError
}


extension UserManagement {
    
    func signIn(withEmail email: String, andPassword password: String,
                completion: @escaping (Result<User, UserSignInError>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error,
                let errCode = AuthErrorCode(rawValue: error._code){
                
                switch errCode {
                case .operationNotAllowed: completion(.failure(error: .emailSignInNotAllowed))
                case .userDisabled: completion(.failure(error: .userDisabled))
                case .wrongPassword: completion(.failure(error: .wrongPassword))
                case .invalidEmail: completion(.failure(error: .invalidEmail))
                default: completion(.failure(error: .otherError(rawError: error)))
                }
                
            } else if let user = user {
                completion(.success(value: user))
            } else {
                completion(.failure(error: .unknownError))
            }
        }
    }
}
