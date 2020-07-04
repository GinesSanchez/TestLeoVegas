//
//  CalculatorManagerTests.swift
//  TestLeoVegasTests
//
//  Created by Gines Sanchez Merono on 2020-07-04.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import XCTest
import Firebase
@testable import TestLeoVegas

class CalculatorManagerTests: XCTestCase {

    var calculatorManager: CalculatorManager!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        calculatorManager = CalculatorManager(firebaseDataBase: Firestore.firestore(), internetConnectionManager: InternetConnectionManager())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetDolarValueForBitcoin_WithInternetConnection_CorrectValue() {
        let bitcoinValue = 2.0
        let expectation = XCTestExpectation()

        calculatorManager.getBitcoinValueFor(dollarValue: bitcoinValue) { (result) in
            switch result {
            case .success(let dolarValue):
                XCTAssertEqual(dolarValue, 18535.7)
            default:
                break
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func testGetLocationInfoFrom_WithInternetConnection_CorrectValue() {
        let latitude = 10.10
        let longitude = 4.0
        let expectation = XCTestExpectation()

        calculatorManager.getLocationInfoFrom(latitude: latitude, longitude: longitude) { (result) in
            switch result {
            case .success(let locationInfo):
                XCTAssertEqual(locationInfo, "Mozart 11, 30310 Cartagena")
            default:
                break
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func testGetFeatureToggle_WithInternetConnection_CorrectValue() {
        let expectation = XCTestExpectation()

        calculatorManager.getFeatureToggle { (result) in
            switch result {
            case .success(let featureToggle):
                XCTAssertTrue(featureToggle.add)
                XCTAssertFalse(featureToggle.subtract)
                XCTAssertFalse(featureToggle.multiply)
                XCTAssertFalse(featureToggle.divide)
                XCTAssertTrue(featureToggle.cosine)
                XCTAssertFalse(featureToggle.sine)
                XCTAssertTrue(featureToggle.mapInfo)
                XCTAssertFalse(featureToggle.bitcoinToDollar)
            default:
                break
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

}
