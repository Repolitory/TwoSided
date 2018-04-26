//
//  DBService+CompletionResult.swift
//  Sleight
//
//  Created by C4Q on 4/13/18.
//  Copyright © 2018 DiegoBaca. All rights reserved.
//

import Foundation

protocol DBServiceSuccessType {
    
}

enum DBServiceError: Error {
    case userNotSignedInSomehow
    case disconnectFromSelf
    case otherError(rawError: Error)
    case unknownError
}

enum DBServiceResult {
    case success(DBServiceSuccessType)
    case failure(DBServiceError)
}
