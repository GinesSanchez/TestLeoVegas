//
//  ViewModuleFactory.swift
//  TestLeoVegas
//
//  Created by Gines Sanchez Merono on 2020-06-29.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import Foundation
import Firebase

protocol ViewModuleFactoryType {
    func createCalculatorMainViewModule(firebaseDataBase: Firestore) -> CalculatorMainViewController
}

final class ViewModuleFactory: ViewModuleFactoryType {
    func createCalculatorMainViewModule(firebaseDataBase: Firestore) -> CalculatorMainViewController {
        let viewController: CalculatorMainViewController = CalculatorMainViewController(nibName: "CalculatorMainViewController", bundle: nil)
        let viewModel: CalculatorMainViewModel = CalculatorMainViewModel(delegate: viewController,
                                                                         calculatorManager: CalculatorManager(firebaseDataBase: firebaseDataBase))
        viewController.viewModel = viewModel
        return viewController
    }
}
