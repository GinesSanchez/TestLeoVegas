//
//  CalculatorCoordinator.swift
//  TestLeoVegas
//
//  Created by Gines Sanchez Merono on 2020-06-29.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import UIKit

protocol CalculatorCoordinatorType: Coordinating { }

final class CalculatorCoordinator: CalculatorCoordinatorType {

    var navigationController: UINavigationController
    let viewModuleFactory: ViewModuleFactoryType

    private var calculatorMainViewController: CalculatorMainViewController?

    init(navigationController: UINavigationController, viewModuleFactory: ViewModuleFactoryType) {
        self.navigationController = navigationController
        self.viewModuleFactory = viewModuleFactory
    }

    func start() {
        calculatorMainViewController = viewModuleFactory.createCalculatorMainViewModule()
        navigationController.pushViewController(calculatorMainViewController!, animated: true)
    }

    func stop() {
        self.navigationController .popViewController(animated: true)
        calculatorMainViewController = nil
    }
}
