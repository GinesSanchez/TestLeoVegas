//
//  CalculatorMainViewModel.swift
//  TestLeoVegas
//
//  Created by Gines Sanchez Merono on 2020-07-01.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import Foundation

enum Operation {
    case bitCoinToDollar
    case mapLocation
    case sin
    case cos
    case divide
    case multiply
    case subtract
    case add
    case none
}

enum CalculatorViewModelState {
    case initialized
    case writingFirstOperator
    case writingOperationAfterFirstOperator
    case writingSecondOperator
    case writingOperationAfterSecondOperator
    case writingEqual
    case operationCompleted
}

enum CalculatorViewModelEvent {
    case none
    case viewLoaded
    case featureToggleLoaded
    case allClearTapped
    case operationTapped(operation: Operation)
    case numberTapped(number: Int)
    case decimalTapped
    case equalTapped
}

protocol CalculatorMainViewModelDelegate: class {
    func viewModel(_ viewModel: CalculatorMainViewModelType, updateScreenText text: String, operation: Operation)
    func viewModel(_ viewModel: CalculatorMainViewModelType, setSelectedButtonStateForOperation operation: Operation)
    func viewModel(_ viewModel: CalculatorMainViewModelType, setDefaultButtonStateForOperation operation: Operation)
    func viewModel(_ viewModel: CalculatorMainViewModelType, isHiddenCalculator: Bool)
    func viewModel(_ viewModel: CalculatorMainViewModelType, updateViewWithFeatureToogle: CalculatorFeatureToggle)
    func viewModel(_ viewModel: CalculatorMainViewModelType, showErrorAlertWithMessage: String)
}

protocol CalculatorMainViewModelType {
    var delegate: CalculatorMainViewModelDelegate? { get }
    var calculatorManager: CalculatorManagerType { get }
    init(delegate: CalculatorMainViewModelDelegate?, calculatorManager: CalculatorManagerType)
}

final class CalculatorMainViewModel: CalculatorMainViewModelType {
    weak var delegate: CalculatorMainViewModelDelegate?
    internal let calculatorManager: CalculatorManagerType

    private var firstOperator: Double?
    private var secondOperator: Double?
    private var currentOperation: Operation

    private var state: CalculatorViewModelState

    var event: CalculatorViewModelEvent {
        didSet {
            updateState(state, withEvent: event)
        }
    }

    var currentScreenText: String {
        didSet {
            delegate?.viewModel(self, updateScreenText: currentScreenText, operation: currentOperation)
        }
    }

    init(delegate: CalculatorMainViewModelDelegate?, calculatorManager: CalculatorManagerType) {
        self.delegate = delegate
        self.calculatorManager = calculatorManager

        self.state = .initialized
        self.event = .none

        self.currentOperation = .none
        self.firstOperator = nil
        self.secondOperator = nil
        self.currentScreenText = ""
    }
}

// MARK: - CalculatorMainViewModelDelegate
extension CalculatorMainViewModel: CalculatorMainViewControllerDelegate {
    func didTapAllClear() {
        event = .allClearTapped
    }

    func viewDidLoad() {
        event = .viewLoaded
    }

    func didTapOperation(_ operation: Operation) {
        event = .operationTapped(operation: operation)
    }

    func didTapEqual() {
        event = .equalTapped
    }

    func didTapNumber(_ number: Int) {
        event = .numberTapped(number: number)
    }

    func didTapDecimal() {
        event = .decimalTapped
    }
}

private extension CalculatorMainViewModel {
    func updateState(_ state: CalculatorViewModelState, withEvent event: CalculatorViewModelEvent) {
        print("state: \(state) - event: \(event)")
        switch (state, event) {
        case (.initialized, .viewLoaded):
            self.currentScreenText = L10n.Calculator.Loading.message
            delegate?.viewModel(self, isHiddenCalculator: true)
            calculatorManager.getFeatureToggle { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .success(let featureToggle):
                    self.delegate?.viewModel(self, isHiddenCalculator: false)
                    self.delegate?.viewModel(self, updateViewWithFeatureToogle: featureToggle)
                    self.event = .featureToggleLoaded
                default:
                    break
                }
            }
        case (.initialized, .featureToggleLoaded):
            currentScreenText = "0"
        case (.initialized, .numberTapped(let number)):
            self.state = .writingFirstOperator
            currentScreenText = String(number)
        case (.initialized, .operationTapped(let operation)):
            currentOperation = operation
            calculateOperation()
            self.state = .operationCompleted
            currentOperation = .none
        case (.writingFirstOperator, .numberTapped(let number)):
            currentScreenText = currentScreenText + String(number)
        case (.writingFirstOperator, .allClearTapped):
            self.state = .initialized
            currentScreenText = "0"
        case (.writingFirstOperator, .operationTapped(let operation)):
            self.state = .writingOperationAfterFirstOperator
            currentOperation = operation
            firstOperator = Double(currentScreenText)
            if isUniryOperation(operation) {
                calculateOperation()
            }
            delegate?.viewModel(self, setSelectedButtonStateForOperation: operation)
        case (.writingOperationAfterFirstOperator, .numberTapped(let number)):
            self.state = .writingSecondOperator
            currentScreenText = String(number)
            delegate?.viewModel(self, setDefaultButtonStateForOperation: currentOperation)
        case (.writingOperationAfterFirstOperator, .allClearTapped):
            self.state = .initialized
            firstOperator = nil
            currentScreenText = "0"
            delegate?.viewModel(self, setDefaultButtonStateForOperation: currentOperation)
        case (.writingSecondOperator, .numberTapped(let number)):
            currentScreenText = currentScreenText + String(number)
        case (.writingSecondOperator, .allClearTapped):
            self.state = .writingOperationAfterFirstOperator
            delegate?.viewModel(self, setSelectedButtonStateForOperation: currentOperation)
            currentScreenText = "0"
        case (.writingSecondOperator, .operationTapped(let operation)):
            secondOperator = Double(currentScreenText)
            if isUniryOperation(operation) {
                currentOperation = operation
            }
            calculateOperation()
            if !isUniryOperation(operation) {
                currentOperation = operation
            }
            self.state = .writingOperationAfterFirstOperator
            delegate?.viewModel(self, setSelectedButtonStateForOperation: operation)
        case (.writingSecondOperator, .equalTapped):
            secondOperator = Double(currentScreenText)
            calculateOperation()
            self.state = .operationCompleted
            currentOperation = .none
        case (.operationCompleted, .operationTapped(let operation)):
            if isUniryOperation(operation) {
                currentOperation = operation
                calculateOperation()
            } else {
                self.state = .writingOperationAfterFirstOperator
                currentOperation = operation
                delegate?.viewModel(self, setSelectedButtonStateForOperation: operation)
            }
        case (.operationCompleted, .numberTapped(let number)):
            self.state = .writingSecondOperator
            currentScreenText = String(number)
            delegate?.viewModel(self, setDefaultButtonStateForOperation: currentOperation)
        case (.operationCompleted, .allClearTapped):
            self.state = .initialized
            currentScreenText = "0"
        case (_, .decimalTapped):
            self.currentScreenText = self.currentScreenText + "."
        default:
            break
        }
    }

    func calculateOperation() {
        if isUniryOperation(currentOperation) {
            switch currentOperation {
                case .bitCoinToDollar:
                    guard let dolarDouble = Double(currentScreenText) else {
                        self.currentScreenText = L10n.Calculator.Screen.Error.message
                        return
                    }
                calculatorManager.getBitcoinValueFor(dollarValue: dolarDouble) { [weak self] (result) in
                        guard let self = self else { return }
                        switch result {
                        case .failure(let error):
                            switch error {
                            case .noInternetConnection:
                                self.delegate?.viewModel(self, showErrorAlertWithMessage: L10n.Calculator.Error.Message.noInternet)
                                self.currentScreenText = L10n.Calculator.Screen.Error.message
                            default:
                                self.delegate?.viewModel(self, showErrorAlertWithMessage: L10n.Calculator.Error.Message.genericBitcoinDolarValue)
                                self.currentScreenText = L10n.Calculator.Screen.Error.message
                            }
                        case .success(let bitcoinValue):
                            self.firstOperator = bitcoinValue
                            self.currentScreenText = self.formartResult(self.firstOperator)
                        }
                    }
                    break
                case .sin:
                    guard let currentFloatValue = Double(currentScreenText) else {
                        self.currentScreenText = L10n.Calculator.Screen.Error.message
                        return
                    }
                    firstOperator = __sinpi(currentFloatValue/180.0)
                    currentScreenText = formartResult(firstOperator)
                case .cos:
                    guard let currentFloatValue = Double(currentScreenText) else {
                        self.currentScreenText = L10n.Calculator.Screen.Error.message
                        return
                    }
                    firstOperator = __cospi(currentFloatValue/180.0)
                    currentScreenText = formartResult(firstOperator)
                default:
                    break
                }
        } else {
            guard let firstOperator = self.firstOperator, let secondOperator = self.secondOperator else {
                return
            }

            switch currentOperation {
            case .add:
                self.firstOperator = firstOperator + secondOperator
                self.currentScreenText = formartResult(self.firstOperator)
            case .subtract:
                self.firstOperator = firstOperator - secondOperator
                self.currentScreenText = formartResult(self.firstOperator)
            case .multiply:
                self.firstOperator = firstOperator * secondOperator
                self.currentScreenText = formartResult(self.firstOperator)
            case .divide:
                guard secondOperator != 0 else {
                    self.currentScreenText = L10n.Calculator.Screen.Error.message
                    return
                }
                self.firstOperator = firstOperator / secondOperator
                currentScreenText = formartResult(self.firstOperator)
            case .mapLocation:
                calculatorManager.getLocationInfoFrom(latitude: firstOperator, longitude: secondOperator) { [weak self] (result) in
                    guard let self = self else { return }
                    switch result {
                    case .failure(let error):
                    switch error {
                    case .noInternetConnection:
                        self.delegate?.viewModel(self, showErrorAlertWithMessage: L10n.Calculator.Error.Message.noInternet)
                        self.currentScreenText = L10n.Calculator.Screen.Error.message
                    default:
                        self.delegate?.viewModel(self, showErrorAlertWithMessage: L10n.Calculator.Error.Message.genericLocationInfo)
                        self.currentScreenText = L10n.Calculator.Screen.Error.message
                    }
                    case .success(let locationInfo):
                        self.currentScreenText = locationInfo
                        self.firstOperator = 0
                        self.secondOperator = 0
                    }
                }
            default:
                break
            }
        }
    }

    func isUniryOperation(_ operation: Operation) -> Bool {
        return operation == .bitCoinToDollar
            || operation == .sin
            || operation == .cos
    }

    func formartResult( _ double: Double?) -> String {
        guard let double = double else { return "0" }
        guard double != double.rounded() else {
            return String(Int(double))
        }
        return String(double)
    }
}
