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
    runFlow1()
  }
  
  // MARK: - Private funcs
  private func runFlow1() {
    let flow1Coordinator = coordinatorFactory.makeFlow1Coordinator(navigationController: rootViewController)
    flow1Coordinator.finishFlow = { [weak self, weak flow1Coordinator] in
      self?.removeDependency(flow1Coordinator)
      self?.runFlow2()
    }
    addDependency(flow1Coordinator)
    flow1Coordinator.start()
  }
  
  private func runFlow2() {
    let flow2Coordinator = coordinatorFactory.makeFlow2Coordinator(navigationController: rootViewController)
    flow2Coordinator.finishFlow = { [weak self, weak flow2Coordinator] in
      self?.removeDependency(flow2Coordinator)
      self?.runFlow1()
    }
    addDependency(flow2Coordinator)
    flow2Coordinator.start()
  }
}
