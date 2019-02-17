//
//  Flow1Coordinator.swift
//  ApplicationCoordinatorDemo
//
//  Created by Anton Hudz on 2/14/19.
//  Copyright © 2019 Anton Hudz. All rights reserved.
//

protocol Flow1CoordinatorOutput: CoordinatorType {
  var finishFlow: (() -> Void)? { get set }
}

final class Flow1Coordinator: BaseCoordinator, Flow1CoordinatorOutput {
  
  // MARK: - Output
  var finishFlow: (() -> Void)?
  
  // MARK: - Private properties
  private let factory: Flow1ModuleFactoryType
  private let router: RouterType
  
  // MARK: - Lifecycle
  init(factory: Flow1ModuleFactoryType, router: RouterType) {
    self.factory = factory
    self.router = router
  }
  
  func start() {
    showA()
  }
}

// MARK: - Private funcs
extension Flow1Coordinator {
  private func showA() {
    let controllerAOutput = factory.makeControllerA()
    controllerAOutput.onFinishFlow = { [weak self] in
      self?.finishFlow?()
    }
    router.setRoot(module: controllerAOutput)
  }
}
