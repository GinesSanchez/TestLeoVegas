//
//  ViewModuleFactory.swift
//  TestLeoVegas
//
//  Created by Gines Sanchez Merono on 2020-06-29.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import Foundation

protocol ViewModuleFactoryType {
    func createCalculatorMainViewModule() -> CalculatorMainViewController
}

final class ViewModuleFactory: ViewModuleFactoryType {
    func createCalculatorMainViewModule() -> CalculatorMainViewController {
        let viewController: CalculatorMainViewController = CalculatorMainViewController(nibName: "CalculatorMainViewController", bundle: nil)
        let viewModel: CalculatorMainViewModel = CalculatorMainViewModel(delegate: viewController)
        viewController.viewModel = viewModel
        return viewController
    }
}
