//
//  UserManagement+SignUp.swift
//  Sleight
//
//  Created by C4Q on 4/13/18.
//  Copyright © 2018 DiegoBaca. All rights reserved.
//

import Foundation
import FirebaseAuth
/**
 Possible error codes:
 
 + `FIRAuthErrorCodeInvalidEmail` - Indicates the email address is malformed.
 + `FIRAuthErrorCodeEmailAlreadyInUse` - Indicates the email used to attempt sign up
 already exists. Call fetchProvidersForEmail to check which sign-in mechanisms the user
 used, and prompt the user to sign in with one of those.
 + `FIRAuthErrorCodeOperationNotAllowed` - Indicates that email and password accounts
 are not enabled. Enable them in the Auth section of the Firebase console.
 + `FIRAuthErrorCodeWeakPassword` - Indicates an attempt to set a password that is
 considered too weak. The NSLocalizedFailureReasonErrorKey field in the NSError.userInfo
 dictionary object will contain more detailed explanation that can be shown to the user.
 */
enum UserSignUpError: Error, UserManagementErrorEnum {
    case invalidEmail
    case emailAlreadyInUse
    case emailSignUpNotAllowed
    case weakPassword
    
    case otherError(rawError: Error)
    case couldNotSendVerification
    case couldNotSignOutAfterSendingVerification
    case unknownError
}

extension UserManagement {
    
    public func createAccount(withEmail email: String, andPassword password: String, completion: @escaping (Result<User, UserSignUpError>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error,
                let errCode = AuthErrorCode(rawValue: error._code){
                
                switch errCode {
                case .invalidEmail: completion(.failure(error: .invalidEmail))
                case .emailAlreadyInUse: completion(.failure(error: .emailAlreadyInUse))
                case .operationNotAllowed: completion(.failure(error: .emailSignUpNotAllowed))
                case .weakPassword: completion(.failure(error: .weakPassword))
                default: completion(.failure(error: .otherError(rawError: error)))
                }
                
            } else if let user = user {
                // TODO: create Sleight-app version of email verification, to abstract away firebase
                    Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
                        if let error = error,
                            let errCode = AuthErrorCode(rawValue: error._code) {
                            switch errCode {
                            case .invalidRecipientEmail,
                                 .invalidSender,
                                 .invalidMessagePayload,
                                 .userNotFound:
                                completion(.failure(error: .couldNotSendVerification))
                            default:
                                completion(.failure(error: .otherError(rawError: error)))
                            }
                        } else {
                            do {
                                try Auth.auth().signOut()
                                completion(.success(value: user))
                            } catch {
                                completion(.failure(error: .couldNotSendVerification))
                            }
                        }
                    })
                
            } else {
                completion(.failure(error: .unknownError))
            }
        }
    }
}
