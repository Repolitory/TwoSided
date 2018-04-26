//
//  UserManagement+CompletionResult.swift
//  Sleight
//
//  Created by C4Q on 4/13/18.
//  Copyright © 2018 DiegoBaca. All rights reserved.
//

import Foundation
import FirebaseAuth

protocol UserManagementSuccessType {
    
}
protocol UserManagementErrorEnum {
    
}

enum UserManagementError: Error, UserManagementErrorEnum {
    case otherError(rawError: Error)
}

enum UserManagementResult {
    case success(UserManagementSuccessType)
    case failure(UserManagementErrorEnum)
}

extension User: UserManagementSuccessType {
    
}

