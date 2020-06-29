//
//  Coordinating.swift
//  TestKarma
//
//  Created by Gines Sanchez Merono on 2020-06-11.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import UIKit

protocol Coordinating: class {
    //Properties
    var navigationController: UINavigationController { get }
    var viewModuleFactory: ViewModuleFactoryType { get }

    //Functions
    init(navigationController: UINavigationController, viewModuleFactory: ViewModuleFactoryType)
    func start()
    func stop()
}
