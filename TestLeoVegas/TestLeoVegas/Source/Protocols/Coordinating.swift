//
//  Coordinating.swift
//  TestKarma
//
//  Created by Gines Sanchez Merono on 2020-06-11.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import UIKit
import Firebase

protocol Coordinating: class {
    //Properties
    var navigationController: UINavigationController { get }
    var viewModuleFactory: ViewModuleFactoryType { get }
    var firebaseDataBase: Firestore { get }

    //Functions
    init(navigationController: UINavigationController, viewModuleFactory: ViewModuleFactoryType, firebaseDataBase: Firestore)
    func start()
    func stop()
}
