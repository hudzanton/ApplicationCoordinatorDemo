//
//  Flow2Coordinator.swift
//  ApplicationCoordinatorDemo
//
//  Created by Anton Hudz on 2/17/19.
//  Copyright © 2019 Anton Hudz. All rights reserved.
//

protocol Flow2CoordinatorOutput: CoordinatorType {
  var finishFlow: (() -> Void)? { get set }
}

final class Flow2Coordinator: BaseCoordinator, Flow2CoordinatorOutput {
  
  // MARK: - Output
  var finishFlow: (() -> Void)?
  
  // MARK: - Private properties
  private let factory: Flow2ModuleFactoryType
  private let router: RouterType
  
  // MARK: - Lifecycle
  init(factory: Flow2ModuleFactoryType, router: RouterType) {
    self.factory = factory
    self.router = router
  }
  
  func start() {
    showB()
  }
}

// MARK: - Private funcs
extension Flow2Coordinator {
  private func showB() {
    let controllerBOutput = factory.makeControllerB()
    controllerBOutput.onFinishFlow = { [weak self] in
      self?.finishFlow?()
    }
    controllerBOutput.onNext = { [weak self] in
      self?.showC()
    }
    router.setRoot(module: controllerBOutput)
  }
  
  private func showC() {
    let controllerCOutput = factory.makeControllerC()
    controllerCOutput.onBack = { [weak self] in
      self?.router.popModule(animated: true)
    }
    router.push(controllerCOutput, animated: true, completion: nil)
  }
}
