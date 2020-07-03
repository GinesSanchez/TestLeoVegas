//
//  CalculatorButton.swift
//  TestLeoVegas
//
//  Created by Gines Sanchez Merono on 2020-06-30.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import UIKit

@IBDesignable
class CalculatorNumberButton: UIButton {

    override init(frame: CGRect){
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    func setup() {
        clipsToBounds = true
        layer.cornerRadius = 14

        setTitleColor(Asset.calculatorButtonTitleNormal.color, for: .normal)
        setTitleColor(Asset.calculatorButtonTitleSelected.color, for: .selected)
        backgroundColor = Asset.calculatorNumber.color
    }
}
