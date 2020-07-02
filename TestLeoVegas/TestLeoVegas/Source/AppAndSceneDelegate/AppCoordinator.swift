//
//  AppCoordinator.swift
//  TestKarma
//
//  Created by Gines Sanchez Merono on 2020-06-11.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import UIKit
import Firebase

protocol AppCoordinatorType: Coordinating { }

final class AppCoordinator: AppCoordinatorType {
    let navigationController: UINavigationController
    let viewModuleFactory: ViewModuleFactoryType
    let firebaseDataBase: Firestore

    private var calculatorCoordinator: CalculatorCoordinatorType?


    init(navigationController: UINavigationController, viewModuleFactory: ViewModuleFactoryType, firebaseDataBase: Firestore) {
        self.navigationController = navigationController
        self.viewModuleFactory = viewModuleFactory
        self.firebaseDataBase = firebaseDataBase
    }

    func start() {
        calculatorCoordinator = CalculatorCoordinator(navigationController: self.navigationController,
                                                      viewModuleFactory: viewModuleFactory,
                                                      firebaseDataBase: firebaseDataBase)
        calculatorCoordinator?.start()
    }

    func stop() {
    }
}
