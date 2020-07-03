//
//  ViewController+Alert.swift
//  TestLeoVegas
//
//  Created by Gines Sanchez Merono on 2020-07-03.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import UIKit

extension UIViewController {
    public func showOneButtonAlert(title: String, message: String, buttonTitle: String, buttonStyle: UIAlertAction.Style, buttonHandler: ((UIAlertAction) -> Void)? = nil) {

        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: buttonStyle, handler: buttonHandler))
        self.present(alert, animated: true, completion: nil)
    }

    public func showErrorAlert(message: String) {
        showOneButtonAlert(title: "Error", message: message, buttonTitle: "Okay", buttonStyle: .default)  //TODO: Localize
    }
}
