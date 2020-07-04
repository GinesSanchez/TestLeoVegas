//
//  CalculatorCoordinatorTests.swift
//  TestLeoVegasTests
//
//  Created by Gines Sanchez Merono on 2020-07-04.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import XCTest
import Firebase
@testable import TestLeoVegas

class CalculatorCoordinatorTests: XCTestCase {

    var calculatorCoordinator: CalculatorCoordinatorType!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        calculatorCoordinator = CalculatorCoordinator(navigationController: UINavigationController(),
                                                      viewModuleFactory: ViewModuleFactory(),
                                                      firebaseDataBase: Firestore.firestore())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCalculatorCoordinator_Initialized_CalculatorCoordinatorIsNil() {
        XCTAssertNil(calculatorCoordinator.calculatorMainViewController)
    }

    func testCalculatorCoordinator_Start_CalculatorCoordinatorNotNil() {
        calculatorCoordinator.start()
        XCTAssertNotNil(calculatorCoordinator.calculatorMainViewController)
        XCTAssertEqual(calculatorCoordinator.navigationController.viewControllers.count, 1)
    }

    func testCalculatorCoordinator_Stop_CalculatorCoordinatorNotNil() {
        calculatorCoordinator.stop()
        XCTAssertNil(calculatorCoordinator.calculatorMainViewController)
        XCTAssertEqual(calculatorCoordinator.navigationController.viewControllers.count, 0)
    }
}
