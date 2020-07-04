//
//  CalculatorViewModelTests.swift
//  TestLeoVegasTests
//
//  Created by Gines Sanchez Merono on 2020-07-04.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import XCTest
import Firebase
@testable import TestLeoVegas

class CalculatorViewModelTests: XCTestCase {

    var calculatorViewModel: CalculatorMainViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        calculatorViewModel = CalculatorMainViewModel(delegate: nil,
                                                      calculatorManager: CalculatorManager(firebaseDataBase: Firestore.firestore(),
                                                                                           internetConnectionManager: InternetConnectionManager()))
        calculatorViewModel.event = .featureToggleLoaded
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //All Clear
    func testCalculatorViewMode_PressOneNumberAndAllClear_CurrentScreenTextEqualToZero() {
        calculatorViewModel.didTapNumber(3)
        calculatorViewModel.didTapAllClear()
        XCTAssertEqual(calculatorViewModel.currentScreenText, "0")
    }

    func testCalculatorViewMode_AddTwoNumbersPressAllClearAddOneNumberAndPressEqual_CurrentScreenTextEqualToAddition() {
        calculatorViewModel.didTapNumber(3)
        calculatorViewModel.didTapOperation(.add)
        calculatorViewModel.didTapNumber(2)
        calculatorViewModel.didTapAllClear()
        calculatorViewModel.didTapNumber(4)
        calculatorViewModel.didTapEqual()
        XCTAssertEqual(calculatorViewModel.currentScreenText, "7")
    }

    func testCalculatorViewMode_AddTwoNumbersAndPressAllClearTwoTimes_CurrentScreenTextEqualToZero() {
        calculatorViewModel.didTapNumber(3)
        calculatorViewModel.didTapOperation(.add)
        calculatorViewModel.didTapNumber(2)
        calculatorViewModel.didTapAllClear()
        calculatorViewModel.didTapAllClear()
        XCTAssertEqual(calculatorViewModel.currentScreenText, "0")
    }

    //Unary operators
    func testCalculatorViewMode_PressCosine_CurrentScreenTextEqualToCosine() {
        calculatorViewModel.didTapOperation(.cos)
        XCTAssertEqual(calculatorViewModel.currentScreenText, "1")
    }

    func testCalculatorViewMode_PressCosineAndPressNumber_CurrentScreenTextEqualToCosine() {
        calculatorViewModel.didTapNumber(90)
        calculatorViewModel.didTapOperation(.cos)
        XCTAssertEqual(calculatorViewModel.currentScreenText, "0")
    }

    func testCalculatorViewMode_PressSine_CurrentScreenTextEqualToCosine() {
        calculatorViewModel.didTapOperation(.sin)
        XCTAssertEqual(calculatorViewModel.currentScreenText, "0")
    }

    func testCalculatorViewMode_PressSineAndPressNumber_CurrentScreenTextEqualToCosine() {
        calculatorViewModel.didTapNumber(90)
        calculatorViewModel.didTapOperation(.sin)
        XCTAssertEqual(calculatorViewModel.currentScreenText, "1")
    }

    //Binary operators
    func testCalculatorViewMode_AddTwoNumbersAndPressEqual_CurrentScreenTextEqualToAddition() {
        calculatorViewModel.didTapNumber(3)
        calculatorViewModel.didTapOperation(.add)
        calculatorViewModel.didTapNumber(2)
        calculatorViewModel.didTapEqual()
        XCTAssertEqual(calculatorViewModel.currentScreenText, "5")
    }

    func testCalculatorViewMode_SubtractTwoNumbersAndPressEqual_CurrentScreenTextEqualToAddition() {
        calculatorViewModel.didTapNumber(3)
        calculatorViewModel.didTapOperation(.subtract)
        calculatorViewModel.didTapNumber(2)
        calculatorViewModel.didTapEqual()
        XCTAssertEqual(calculatorViewModel.currentScreenText, "1")
    }

    func testCalculatorViewMode_MultiplyTwoNumbersAndPressEqual_CurrentScreenTextEqualToAddition() {
        calculatorViewModel.didTapNumber(3)
        calculatorViewModel.didTapOperation(.multiply)
        calculatorViewModel.didTapNumber(2)
        calculatorViewModel.didTapEqual()
        XCTAssertEqual(calculatorViewModel.currentScreenText, "6")
    }

    func testCalculatorViewMode_DivideTwoNumbersAndPressEqual_CurrentScreenTextEqualToAddition() {
        calculatorViewModel.didTapNumber(10)
        calculatorViewModel.didTapOperation(.divide)
        calculatorViewModel.didTapNumber(4)
        calculatorViewModel.didTapEqual()
        XCTAssertEqual(calculatorViewModel.currentScreenText, "2.5")
    }

    //Decimals
    func testCalculatorViewMode_MultiplyOneNumberAndOneDecimalNumberDivideOneAndPressEqual_CurrentScreenTextEqualToAddition() {
        calculatorViewModel.didTapNumber(10)
        calculatorViewModel.didTapOperation(.multiply)
        calculatorViewModel.didTapNumber(2)
        calculatorViewModel.didTapDecimal()
        calculatorViewModel.didTapNumber(5)
        calculatorViewModel.didTapOperation(.divide)
        calculatorViewModel.didTapNumber(5)
        calculatorViewModel.didTapEqual()
        XCTAssertEqual(calculatorViewModel.currentScreenText, "5")
    }

    //Binary operators. Special convinations
    func testCalculatorViewMode_AddTwoNumbersAndPressAdd_CurrentScreenTextEqualToAddition() {
        calculatorViewModel.didTapNumber(3)
        calculatorViewModel.didTapOperation(.add)
        calculatorViewModel.didTapNumber(2)
        calculatorViewModel.didTapOperation(.add)
        XCTAssertEqual(calculatorViewModel.currentScreenText, "5")
    }

    func testCalculatorViewMode_AddThreeNumbersAndPressEqual_CurrentScreenTextEqualToAddition() {
        calculatorViewModel.didTapNumber(3)
        calculatorViewModel.didTapOperation(.add)
        calculatorViewModel.didTapNumber(2)
        calculatorViewModel.didTapOperation(.add)
        calculatorViewModel.didTapNumber(4)
        calculatorViewModel.didTapEqual()
        XCTAssertEqual(calculatorViewModel.currentScreenText, "9")
    }

    func testCalculatorViewMode_AddTwoNumbersSubtractOneAndPressEqual_CurrentScreenTextEqualToAddition() {
        calculatorViewModel.didTapNumber(3)
        calculatorViewModel.didTapOperation(.add)
        calculatorViewModel.didTapNumber(2)
        calculatorViewModel.didTapOperation(.subtract)
        calculatorViewModel.didTapNumber(4)
        calculatorViewModel.didTapEqual()
        XCTAssertEqual(calculatorViewModel.currentScreenText, "1")
    }

    func testCalculatorViewMode_MultiplyTwoNumbersDivideOneAndPressEqual_CurrentScreenTextEqualToAddition() {
        calculatorViewModel.didTapNumber(10)
        calculatorViewModel.didTapOperation(.multiply)
        calculatorViewModel.didTapNumber(2)
        calculatorViewModel.didTapOperation(.divide)
        calculatorViewModel.didTapNumber(5)
        calculatorViewModel.didTapEqual()
        XCTAssertEqual(calculatorViewModel.currentScreenText, "4")
    }
}
