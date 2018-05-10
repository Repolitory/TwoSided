//
//  TwoSidedTests.swift
//  TwoSidedTests
//
//  Created by C4Q on 5/9/18.
//  Copyright © 2018 DiegoBaca. All rights reserved.
//

import XCTest
@testable import TwoSided

class TwoSidedTests: XCTestCase {
    
    func testCreateDebateTopic() {
        
        let testTopic = DebateTopic(question: "test question", creator: "TestUser", category: .social)
        let testUser = AppUser(id: "testID", displayName: "TestAppUser")
        
        
        
    }
}
