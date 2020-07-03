//
//  CalculatorManager.swift
//  TestLeoVegas
//
//  Created by Gines Sanchez Merono on 2020-07-02.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import Foundation
import Firebase

enum CalculatorManagerError: Error {
    case responseError
    case noResponseData
    case invalidJson
    case unknown
}

protocol CalculatorManagerType {
    var firebaseDataBase: Firestore { get }
    init(firebaseDataBase: Firestore)

    func getBitcoinValueFor(dollarValue: Double, completion: @escaping (Result<Double, CalculatorManagerError>) -> Void)
    func getLocationInfoFrom(latitude: Double, longitude: Double, completion: @escaping (Result<String, CalculatorManagerError>) -> Void)
    func getFeatureToggle(completion: @escaping (Result<CalculatorFeatureToggle, CalculatorManagerError>) -> Void)
}

final class CalculatorManager: CalculatorManagerType {
    let firebaseDataBase: Firestore

    init(firebaseDataBase: Firestore) {
        self.firebaseDataBase = firebaseDataBase
        return
    }

    func getBitcoinValueFor(dollarValue: Double, completion: @escaping (Result<Double, CalculatorManagerError>) -> Void) {
        let docRef = firebaseDataBase.collection("calculator").document("bitcoinValue")

        docRef.getDocument { (document, error) in
            guard error == nil else {
                return completion(.failure(.responseError))
            }

            guard let document = document, document.exists, let dictionary = document.data() else {
                return completion(.failure(.noResponseData))
            }

            guard let bitcoinValue = dictionary["value"] as? Double else {
                return completion(.failure(.invalidJson))
            }

            completion(.success(dollarValue * bitcoinValue))
        }
    }

    func getLocationInfoFrom(latitude: Double, longitude: Double, completion: @escaping (Result<String, CalculatorManagerError>) -> Void) {
        let docRef = firebaseDataBase.collection("calculator").document("localizations")

        docRef.getDocument { (document, error) in
            guard error == nil else {
                return completion(.failure(.responseError))
            }

            guard let document = document, document.exists, let dictionary = document.data() else {
                return completion(.failure(.noResponseData))
            }

            guard let localizationInfo = dictionary["value"] as? String else {
                return completion(.failure(.invalidJson))
            }

            completion(.success(localizationInfo))
        }
    }

    func getFeatureToggle(completion: @escaping (Result<CalculatorFeatureToggle, CalculatorManagerError>) -> Void) {
        let docRef = firebaseDataBase.collection("calculator").document("featureToggle")
        let defaultFeatureToggle = CalculatorFeatureToggle()

        docRef.getDocument { (document, error) in
            guard error == nil else {
                return completion(.success(defaultFeatureToggle))
            }

            guard let document = document, document.exists, let dictionary = document.data() else {
                return completion(.success(defaultFeatureToggle))
            }

            completion(.success(CalculatorFeatureToggle(dictionary: dictionary)))
        }
    }
}
