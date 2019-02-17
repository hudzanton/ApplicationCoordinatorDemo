//
//  CoordinatorFactoryType.swift
//  ApplicationCoordinatorDemo
//
//  Created by Anton Hudz on 2/14/19.
//  Copyright © 2019 Anton Hudz. All rights reserved.
//

import UIKit

protocol CoordinatorFactoryType {
  func makeApplicationCoordinator(window: UIWindow) -> ApplicationCoordinatorOutput
  func makeFlow1Coordinator(navigationController: UINavigationController) -> Flow1CoordinatorOutput
  func makeFlow2Coordinator(navigationController: UINavigationController) -> Flow2CoordinatorOutput
}
