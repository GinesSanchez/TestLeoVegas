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
}

final class CalculatorManager: CalculatorManagerType {
    let firebaseDataBase: Firestore

    init(firebaseDataBase: Firestore) {
        self.firebaseDataBase = firebaseDataBase
        return
    }

    func getBitcoinValueFor(dollarValue: Double, completion: @escaping (Result<Double, CalculatorManagerError>) -> Void) {
        let docRef = firebaseDataBase.collection("bitcoinValues").document("Values")

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
        let docRef = firebaseDataBase.collection("localizations").document("description")

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
}
