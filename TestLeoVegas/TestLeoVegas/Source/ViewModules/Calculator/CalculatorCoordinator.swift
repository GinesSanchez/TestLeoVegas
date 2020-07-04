//
//  CalculatorCoordinator.swift
//  TestLeoVegas
//
//  Created by Gines Sanchez Merono on 2020-06-29.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import UIKit
import Firebase

protocol CalculatorCoordinatorType: Coordinating {
    var calculatorMainViewController: CalculatorMainViewController? { get }
}

final class CalculatorCoordinator: CalculatorCoordinatorType {

    let navigationController: UINavigationController
    let viewModuleFactory: ViewModuleFactoryType
    let firebaseDataBase: Firestore

    var calculatorMainViewController: CalculatorMainViewController?

    init(navigationController: UINavigationController, viewModuleFactory: ViewModuleFactoryType, firebaseDataBase: Firestore) {
        self.navigationController = navigationController
        self.viewModuleFactory = viewModuleFactory
        self.firebaseDataBase = firebaseDataBase
    }

    func start() {
        calculatorMainViewController = viewModuleFactory.createCalculatorMainViewModule(firebaseDataBase: firebaseDataBase)
        navigationController.pushViewController(calculatorMainViewController!, animated: true)
    }

    func stop() {
        self.navigationController .popViewController(animated: true)
        calculatorMainViewController = nil
    }
}
