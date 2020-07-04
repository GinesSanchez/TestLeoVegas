//
//  ViewModuleFactoryTests.swift
//  TestLeoVegasTests
//
//  Created by Gines Sanchez Merono on 2020-07-04.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import XCTest
import Firebase
@testable import TestLeoVegas

class ViewModuleFactoryTests: XCTestCase {

    var viewModuleFactory: ViewModuleFactoryType!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModuleFactory = ViewModuleFactory()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewModuleFactory_CreateCalculator_ViewControllerAndViewModuleNotNil() {
        let viewController = viewModuleFactory.createCalculatorMainViewModule(firebaseDataBase: Firestore.firestore())
        let viewModel = viewController.viewModel

        XCTAssertNotNil(viewController)
        XCTAssertNotNil(viewModel)
        XCTAssertTrue(viewModel is CalculatorMainViewModel)
    }

}
