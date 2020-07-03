//
//  CalculatorOperationButton.swift
//  TestLeoVegas
//
//  Created by Gines Sanchez Merono on 2020-07-03.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import UIKit

@IBDesignable
final class CalculatorOperationButton: CalculatorNumberButton {
    override func setup() {
        clipsToBounds = true
        layer.cornerRadius = 14

        setTitleColor(Asset.calculatorButtonTitleNormal.color, for: .normal)
        setTitleColor(Asset.calculatorButtonTitleSelected.color, for: .selected)
        backgroundColor = Asset.calculatorOperation.color
    }
}
