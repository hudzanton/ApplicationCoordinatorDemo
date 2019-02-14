//
//  CoordinatorFactory.swift
//  ApplicationCoordinatorDemo
//
//  Created by Anton Hudz on 2/14/19.
//  Copyright © 2019 Anton Hudz. All rights reserved.
//

import UIKit

final class CoordinatorFactory: CoordinatorSubFactoryType {
  
  // MARK: - Private properties
  private(set) var moduleFactory: ModuleFactory
  private(set) var component: ComponentFactoryType

  // MARK: - Init
  init() {
    self.component = ComponentFactory()
    self.moduleFactory = ModuleFactory(component: self.component)
  }
}

// MARK: - Public funcs
extension CoordinatorFactory: CoordinatorFactoryType {
  func makeApplicationCoordinator(window: UIWindow) -> ApplicationCoordinatorOutput {
    let coordinator = ApplicationCoordinator(coordinatorFactory: self, mainWindow: window)
    return coordinator
  }
  
  func makeLoginCoordinator(navigationController: UINavigationController) -> LoginCoordinatorOutput {
    let coordinator = LoginCoordinator(factory: moduleFactory, router: makeRouter(navigationController))
    return coordinator
  }
}

// MARK: - Private funcs
extension CoordinatorFactory {
  private func makeRouter(_ navigationController: UINavigationController) -> RouterType {
    return Router(rootController: navigationController)
  }
}
