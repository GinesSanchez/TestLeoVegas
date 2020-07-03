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
    @IBOutlet weak var allClearButton: CalculatorAllClearButton!
    @IBOutlet weak var bitcoinToDollarButton: CalculatorOperationButton!
    @IBOutlet weak var mapButton: CalculatorOperationButton!
    @IBOutlet weak var sinButton: CalculatorOperationButton!
    @IBOutlet weak var cosButton: CalculatorOperationButton!
    @IBOutlet weak var divideButton: CalculatorOperationButton!
    @IBOutlet weak var multiplyButton: CalculatorOperationButton!
    @IBOutlet weak var subtractButton: CalculatorOperationButton!
    @IBOutlet weak var addButton: CalculatorOperationButton!
    @IBOutlet weak var equalButton: CalculatorOperationButton!

    //Numbers
    @IBOutlet weak var decimalButton: CalculatorNumberButton!
    @IBOutlet weak var nineButton: CalculatorNumberButton!
    @IBOutlet weak var eightButton: CalculatorNumberButton!
    @IBOutlet weak var sevenButton: CalculatorNumberButton!
    @IBOutlet weak var sixButton: CalculatorNumberButton!
    @IBOutlet weak var fiveButton: CalculatorNumberButton!
    @IBOutlet weak var fourButton: CalculatorNumberButton!
    @IBOutlet weak var threeButton: CalculatorNumberButton!
    @IBOutlet weak var twoButton: CalculatorNumberButton!
    @IBOutlet weak var oneButton: CalculatorNumberButton!
    @IBOutlet weak var zeroButton: CalculatorNumberButton!

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
        viewSetup()
        navigationBarSetup()
        labelsSetup()
    }

    func viewSetup() {
        view.backgroundColor = Asset.calculatorBackground.color
    }

    func navigationBarSetup() {
        self.navigationController?.navigationBar.isHidden = true        
    }

    func labelsSetup() {
        screenLabel.textColor = Asset.calculatorScreenMessage.color
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
