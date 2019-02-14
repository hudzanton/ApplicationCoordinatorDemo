//
//  ApplicationCoordinator.swift
//  ApplicationCoordinatorDemo
//
//  Created by Anton Hudz on 2/14/19.
//  Copyright © 2019 Anton Hudz. All rights reserved.
//

import UIKit

protocol ApplicationCoordinatorOutput: CoordinatorType {}

final class ApplicationCoordinator: BaseCoordinator, ApplicationCoordinatorOutput {
  
  // MARK: - Private properties
  private let coordinatorFactory: (CoordinatorFactoryType & CoordinatorSubFactoryType)
  private let window: UIWindow
  private lazy var rootViewController: UINavigationController = UINavigationController()
  
  // MARK: - Lifecycle
  init(coordinatorFactory: (CoordinatorFactoryType & CoordinatorSubFactoryType),
       mainWindow: UIWindow) {
    self.coordinatorFactory = coordinatorFactory
    self.window = mainWindow
    super.init()
    
    self.window.rootViewController = rootViewController
  }
  
  func start() {
    window.makeKeyAndVisible()
    runLoginFlow()
  }
  
  // MARK: - Private funcs
  private func runLoginFlow() {
    let loginCoordinator = coordinatorFactory.makeLoginCoordinator(navigationController: rootViewController)
    loginCoordinator.finishFlow = { [weak self, weak loginCoordinator] in
      self?.removeDependency(loginCoordinator)
    }
    addDependency(loginCoordinator)
    loginCoordinator.start()
  }
}
