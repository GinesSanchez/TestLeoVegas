//
//  CalculatorMainViewController.swift
//  TestLeoVegas
//
//  Created by Gines Sanchez Merono on 2020-06-29.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import UIKit

protocol CalculatorMainViewControllerDelegate: class {
    func viewDidLoad()
    func didTapOperation(_ operation: Operation)
    func didTapEqual()
    func didTapNumber(_ number: Int)
    func didTapDecimal()
    func didTapAllClear()
}

final class CalculatorMainViewController: UIViewController {

    //Views
    @IBOutlet weak var calculatorStackView: UIStackView!

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

    //Delegates
    var viewModel: CalculatorMainViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        viewModel?.viewDidLoad()
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
    }
}

// MARK: IBActions
extension CalculatorMainViewController {
    @IBAction func allClearButtonTapped(_ sender: Any) {
        viewModel?.didTapAllClear()
    }

    @IBAction func bitcoinToDollarButtonTapped(_ sender: Any) {
        viewModel?.didTapOperation(.bitCoinToDollar)
    }

    @IBAction func mapButtonTapped(_ sender: Any) {
        viewModel?.didTapOperation(.mapLocation)
    }

    @IBAction func sinButtonTapped(_ sender: Any) {
        viewModel?.didTapOperation(.sin)
    }

    @IBAction func cosButtonTapped(_ sender: Any) {
        viewModel?.didTapOperation(.cos)
    }

    @IBAction func divideButtonTapped(_ sender: Any) {
        viewModel?.didTapOperation(.divide)
    }

    @IBAction func multiplyButtonTapped(_ sender: Any) {
        viewModel?.didTapOperation(.multiply)
    }

    @IBAction func subtractButtonTapped(_ sender: Any) {
        viewModel?.didTapOperation(.subtract)
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        viewModel?.didTapOperation(.add)
    }

    @IBAction func equalButtonTapped(_ sender: Any) {
        viewModel?.didTapEqual()
    }

    @IBAction func decimalButtonTapped(_ sender: Any) {
        viewModel?.didTapDecimal()
    }

    @IBAction func numberButtonTapped(_ sender: UIButton) {
        viewModel?.didTapNumber(sender.tag)
    }
}

extension CalculatorMainViewController: CalculatorMainViewModelDelegate {
    func viewModel(_ viewModel: CalculatorMainViewModelType, updateScreenText text: String, operation: Operation) {
        self.screenLabel.text = text
    }

    func viewModel(_ viewModel: CalculatorMainViewModelType, setSelectedButtonStateForOperation operation: Operation) {
        setButton(isSelected: true, operation: operation)
    }

    func viewModel(_ viewModel: CalculatorMainViewModelType, setDefaultButtonStateForOperation operation: Operation) {
        setButton(isSelected: false, operation: operation)
    }

    func viewModel(_ viewModel: CalculatorMainViewModelType, isHiddenCalculator: Bool) {
        calculatorStackView.isHidden = isHiddenCalculator
    }

    func viewModel(_ viewModel: CalculatorMainViewModelType, updateViewWithFeatureToogle featureToggle: CalculatorFeatureToggle) {
        addButton.isHidden = !featureToggle.add
        subtractButton.isHidden = !featureToggle.subtract
        divideButton.isHidden = !featureToggle.divide
        multiplyButton.isHidden = !featureToggle.multiply
        cosButton.isHidden = !featureToggle.cosine
        sinButton.isHidden = !featureToggle.sine
        mapButton.isHidden = !featureToggle.mapInfo
        bitcoinToDollarButton.isHidden = !featureToggle.bitcoinToDollar
    }

    func viewModel(_ viewModel: CalculatorMainViewModelType, showErrorAlertWithMessage message: String) {
        showErrorAlert(message: message)
    }
}

// MARK: Helper functions
private extension CalculatorMainViewController {
    func setButton(isSelected: Bool, operation: Operation) {
        switch operation {
        case .divide:
            divideButton.isSelected = isSelected
        case .multiply:
            multiplyButton.isSelected = isSelected
        case .subtract:
            subtractButton.isSelected = isSelected
        case .add:
            addButton.isSelected = isSelected
        case .mapLocation:
            mapButton.isSelected = isSelected
        default:
            break
        }
    }
}
