//
//  CalculatorMainViewController.swift
//  TestLeoVegas
//
//  Created by Gines Sanchez Merono on 2020-06-29.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import UIKit

final class CalculatorMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }
}

private extension CalculatorMainViewController {
    func setUp() {
        navigationBarSetup()
    }

    func navigationBarSetup() {
        self.title = "Calculator"   //TODO: Localize
    }
}
