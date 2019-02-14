//
//  BaseCoordinator.swift
//  ApplicationCoordinatorDemo
//
//  Created by Anton Hudz on 2/14/19.
//  Copyright © 2019 Anton Hudz. All rights reserved.
//

import UIKit

class BaseCoordinator: NSObject {
  
  // MARK: - Private properties
  private var childCoordinators: [CoordinatorType] = []

  // MARK: - Public funcs
  public func addDependency(_ coordinator: CoordinatorType) {
    for element in childCoordinators where element === coordinator {
      return
    }

    childCoordinators.append(coordinator)
  }

  public func removeDependency(_ coordinator: CoordinatorType?) {
    guard childCoordinators.isEmpty == false, let coordinator = coordinator else {
      return
    }

    for (index, element) in childCoordinators.enumerated() where element === coordinator {
      childCoordinators.remove(at: index)
      break
    }
  }

  public func removeAllDependencies() {
    for coordinator in childCoordinators {
      removeDependency(coordinator)
    }
  }

  public func dependencies() -> [CoordinatorType] {
    return childCoordinators
  }

  deinit {
    print(String(describing: self))
  }
}
