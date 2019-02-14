//
//  Router.swift
//  ApplicationCoordinatorDemo
//
//  Created by Anton Hudz on 2/14/19.
//  Copyright © 2019 Anton Hudz. All rights reserved.
//

import UIKit

protocol RouterType: class, PresentType {
  func present(_ module: PresentType?, animated: Bool)
  func push(_ module: PresentType?, animated: Bool, completion: (() -> Void)?)
  func popModule(animated: Bool)
  func dismissModule()
  func dismissModule(animated: Bool, completion: (() -> Void)?)
  func setRoot(module: PresentType?)
  func popToRootModule(animated: Bool)
}

final class Router {
  private weak var rootController: UINavigationController?
  private var completions: [UIViewController : () -> Void] = [:]
  private var containers: [UINavigationController]

  init(rootController: UINavigationController) {
    self.rootController = rootController
    self.containers = [rootController]
  }
}

extension Router: RouterType {
  var toPresent: UIViewController? {
    return rootController
  }

  func present(_ module: PresentType?, animated: Bool) {
    guard let controller = module?.toPresent else { return }
    rootController?.present(controller, animated: animated, completion: nil)
  }

  func push(_ module: PresentType?, animated: Bool, completion: (() -> Void)?) {
    guard let controller = module?.toPresent, (controller is UINavigationController == false) else { return }

    if let completion = completion {
      completions[controller] = completion
    }
    rootController?.pushViewController(controller, animated: animated)
  }

  func popModule(animated: Bool) {
    if let controller = rootController?.popViewController(animated: animated) {
      runCompletion(for: controller)
    }
  }

  func dismissModule() {
    dismissModule(animated: true, completion: nil)
  }

  func dismissModule(animated: Bool, completion: (() -> Void)?) {
    rootController?.dismiss(animated: animated, completion: completion)
  }

  func setRoot(module: PresentType?) {
    guard let controller = module?.toPresent else { return }
    rootController?.setViewControllers([controller], animated: false)
  }

  func popToRootModule(animated: Bool) {
    if let controllers = rootController?.popToRootViewController(animated: animated) {
      controllers.forEach { controller in
        runCompletion(for: controller)
      }
    }
  }
}

extension Router {
  private func runCompletion(for controller: UIViewController) {
    guard let completion = completions[controller] else { return }
    completion()
    completions.removeValue(forKey: controller)
  }
}
