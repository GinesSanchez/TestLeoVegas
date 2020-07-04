//
//  AppCoordinatorTests.swift
//  TestLeoVegasTests
//
//  Created by Gines Sanchez Merono on 2020-07-04.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import XCTest
import Firebase
@testable import TestLeoVegas

class AppCoordinatorTests: XCTestCase {

    var appCoordinator: AppCoordinatorType!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        appCoordinator = AppCoordinator(navigationController: UINavigationController(),
                                        viewModuleFactory: ViewModuleFactory(),
                                        firebaseDataBase: Firestore.firestore())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAppCoordinator_Initialized_CalculatorCoordinatorIsNil() {
        XCTAssertNil(appCoordinator.calculatorCoordinator)
    }

    func testAppCoordinator_Start_CalculatorCoordinatorNotNil() {
        appCoordinator.start()
        XCTAssertNotNil(appCoordinator.calculatorCoordinator)
    }

    func testAppCoordinator_Stop_CalculatorCoordinatorNotNil() {
        appCoordinator.stop()
        XCTAssertNil(appCoordinator.calculatorCoordinator)
    }
}
