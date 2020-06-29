//
//  AppCoordinator.swift
//  TestKarma
//
//  Created by Gines Sanchez Merono on 2020-06-11.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import UIKit

protocol AppCoordinatorType: Coordinating { }

final class AppCoordinator: AppCoordinatorType {
    let navigationController: UINavigationController
    let viewModuleFactory: ViewModuleFactoryType

    private var calculatorCoordinator: CalculatorCoordinatorType?

    init(navigationController: UINavigationController, viewModuleFactory: ViewModuleFactoryType) {
        self.navigationController = navigationController
        self.viewModuleFactory = viewModuleFactory
    }

    func start() {
        calculatorCoordinator = CalculatorCoordinator(navigationController: self.navigationController, viewModuleFactory: viewModuleFactory)
        calculatorCoordinator?.start()
    }

    func stop() {
    }
}
