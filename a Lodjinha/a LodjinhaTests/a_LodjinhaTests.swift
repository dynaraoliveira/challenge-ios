//
//  a_LodjinhaTests.swift
//  a LodjinhaTests
//
//  Created by Dynara Rico Oliveira on 06/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import XCTest
@testable import a_Lodjinha

class a_LodjinhaTests: XCTestCase {

    var controller: HomeViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        self.controller = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
    }
    
    override func tearDown() {
        self.controller = nil
        super.tearDown()
    }

    func testExample() {
        self.controller.viewDidLoad()
        XCTAssertNotNil(self.controller.navigationItem.titleView, "titleView is nil")
    }

}
