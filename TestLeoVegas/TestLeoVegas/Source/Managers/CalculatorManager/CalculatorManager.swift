//
//  CalculatorManager.swift
//  TestLeoVegas
//
//  Created by Gines Sanchez Merono on 2020-07-02.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import Foundation
import Firebase

protocol CalculatorManagerType {
    var firebaseDataBase: Firestore { get }
    init(firebaseDataBase: Firestore)

    //TODO: Add endpoint calls declaration
}

final class CalculatorManager: CalculatorManagerType {
    let firebaseDataBase: Firestore

    init(firebaseDataBase: Firestore) {
        self.firebaseDataBase = firebaseDataBase
        return
    }

    //TODO: Add endpoint calls implementation
}
