//
//  CalculatorButton.swift
//  TestLeoVegas
//
//  Created by Gines Sanchez Merono on 2020-06-30.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import UIKit

@IBDesignable
final class CalculatorButton: UIButton {

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
        self.clipsToBounds = true
        self.layer.cornerRadius = 14
    }
}
