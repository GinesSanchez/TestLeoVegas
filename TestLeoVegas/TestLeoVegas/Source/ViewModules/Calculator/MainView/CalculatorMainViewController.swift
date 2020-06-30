//
//  CalculatorMainViewController.swift
//  TestLeoVegas
//
//  Created by Gines Sanchez Merono on 2020-06-29.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import UIKit

final class CalculatorMainViewController: UIViewController {

    //Actions
    @IBOutlet weak var bitcoinToDollarButton: CalculatorButton!
    @IBOutlet weak var mapButton: CalculatorButton!
    @IBOutlet weak var allClearButton: CalculatorButton!
    @IBOutlet weak var sinButton: CalculatorButton!
    @IBOutlet weak var cosButton: CalculatorButton!
    @IBOutlet weak var divideButton: CalculatorButton!
    @IBOutlet weak var multiplyButton: CalculatorButton!
    @IBOutlet weak var subtractButton: CalculatorButton!
    @IBOutlet weak var addButton: CalculatorButton!
    @IBOutlet weak var equalButton: CalculatorButton!

    //Numbers
    @IBOutlet weak var decimalButton: CalculatorButton!
    @IBOutlet weak var nineButton: CalculatorButton!
    @IBOutlet weak var eightButton: CalculatorButton!
    @IBOutlet weak var sevenButton: CalculatorButton!
    @IBOutlet weak var sixButton: CalculatorButton!
    @IBOutlet weak var fiveButton: CalculatorButton!
    @IBOutlet weak var fourButton: CalculatorButton!
    @IBOutlet weak var threeButton: CalculatorButton!
    @IBOutlet weak var twoButton: CalculatorButton!
    @IBOutlet weak var oneButton: CalculatorButton!
    @IBOutlet weak var zeroButton: CalculatorButton!

    //Labels
    @IBOutlet weak var screenLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

// MARK: Setup functions
private extension CalculatorMainViewController {
    func setUp() {
        navigationBarSetup()
        buttonsSetup()
        labelsSetup()
    }

    func navigationBarSetup() {
        self.navigationController?.navigationBar.isHidden = true        
    }

    func buttonsSetup() {
        //TODO: Add color set up
        //TODO: Add online operator set up
    }

    func labelsSetup() {
        //TODO: Add color set up
        screenLabel.text = "4"
    }
}

// MARK: IBActions
extension CalculatorMainViewController {
    @IBAction func bitcoinToDollarButtonTapped(_ sender: Any) {
    }

    @IBAction func mapButtonTapped(_ sender: Any) {
    }


    @IBAction func allClearButtonTapped(_ sender: Any) {
    }

    @IBAction func sinButtonTapped(_ sender: Any) {
    }

    @IBAction func cosButtonTapped(_ sender: Any) {
    }

    @IBAction func divideButtonTapped(_ sender: Any) {
    }

    @IBAction func multiplyButtonTapped(_ sender: Any) {
    }

    @IBAction func subtractButtonTapped(_ sender: Any) {
    }

    @IBAction func addButtonTapped(_ sender: Any) {
    }

    @IBAction func equalButtonTapped(_ sender: Any) {
    }

    @IBAction func decimalButtonTapped(_ sender: Any) {
    }

    @IBAction func numberButtonTapped(_ sender: UIButton) {        
    }
}
