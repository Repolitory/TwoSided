//
//  Result.swift
//  Menagerie
//
//  Created by C4Q on 4/20/18.
//  Copyright © 2018 DiegoBaca. All rights reserved.
//

import Foundation

enum Result<T, U: Error> {
    case success(value: T)
    case failure(error: U)
}
