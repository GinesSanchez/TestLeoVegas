//
//  CalculatorFeatureToggleTests.swift
//  TestLeoVegasTests
//
//  Created by Gines Sanchez Merono on 2020-07-04.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import XCTest
@testable import TestLeoVegas

class CalculatorFeatureToggleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateCalculatorFeatureToggle_NilDictionary_DefaultFeatureToogle() {
        let featureToggle = CalculatorFeatureToggle(dictionary: nil)

        XCTAssertTrue(featureToggle.add)
        XCTAssertTrue(featureToggle.subtract)
        XCTAssertTrue(featureToggle.multiply)
        XCTAssertTrue(featureToggle.divide)
        XCTAssertTrue(featureToggle.cosine)
        XCTAssertTrue(featureToggle.sine)
        XCTAssertTrue(featureToggle.mapInfo)
        XCTAssertTrue(featureToggle.bitcoinToDollar)
    }

    func testCreateCalculatorFeatureToggle_FullDictionary_CompletedFeatureToogle() {
        let dictionary = ["add" : false,
                          "subtract" : true,
                          "multiply" : true,
                          "divide" : true,
                          "sine" : false,
                          "cosine" : true,
                          "bitcoinToDollar" : true,
                          "mapInfo" : false]

        let featureToggle = CalculatorFeatureToggle(dictionary: dictionary)

        XCTAssertFalse(featureToggle.add)
        XCTAssertTrue(featureToggle.subtract)
        XCTAssertTrue(featureToggle.multiply)
        XCTAssertTrue(featureToggle.divide)
        XCTAssertTrue(featureToggle.cosine)
        XCTAssertFalse(featureToggle.sine)
        XCTAssertFalse(featureToggle.mapInfo)
        XCTAssertTrue(featureToggle.bitcoinToDollar)
    }

    func testCreateCalculatorFeatureToggle_IncompletedDictionary_FeatureToogleWithDefaultValues() {
        let dictionary = ["add" : false,
                          "subtract" : true,
                          "divide" : true,
                          "sine" : false,
                          "mapInfo" : false]

        let featureToggle = CalculatorFeatureToggle(dictionary: dictionary)

        XCTAssertFalse(featureToggle.add)
        XCTAssertTrue(featureToggle.subtract)
        XCTAssertTrue(featureToggle.multiply)
        XCTAssertTrue(featureToggle.divide)
        XCTAssertTrue(featureToggle.cosine)
        XCTAssertFalse(featureToggle.sine)
        XCTAssertFalse(featureToggle.mapInfo)
        XCTAssertTrue(featureToggle.bitcoinToDollar)
    }

    func testCreateCalculatorFeatureToggle_Offline_OfflineFeatureToogle() {

        let featureToggle = CalculatorFeatureToggle.offline()

        XCTAssertTrue(featureToggle.add)
        XCTAssertTrue(featureToggle.subtract)
        XCTAssertTrue(featureToggle.multiply)
        XCTAssertTrue(featureToggle.divide)
        XCTAssertTrue(featureToggle.cosine)
        XCTAssertTrue(featureToggle.sine)
        XCTAssertFalse(featureToggle.mapInfo)
        XCTAssertFalse(featureToggle.bitcoinToDollar)
    }

}
