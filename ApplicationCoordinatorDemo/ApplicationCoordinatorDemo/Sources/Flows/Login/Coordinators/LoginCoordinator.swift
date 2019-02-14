//
//  LoginCoordinator.swift
//  ApplicationCoordinatorDemo
//
//  Created by Anton Hudz on 2/14/19.
//  Copyright © 2019 Anton Hudz. All rights reserved.
//

protocol LoginCoordinatorOutput: CoordinatorType {
  var finishFlow: (() -> Void)? { get set }
}

final class LoginCoordinator: BaseCoordinator, LoginCoordinatorOutput {
  
  // MARK: - Output
  var finishFlow: (() -> Void)?
  
  // MARK: - Private properties
  private let factory: LoginModuleFactoryType
  private let router: RouterType
  
  // MARK: - Lifecycle
  init(factory: LoginModuleFactoryType, router: RouterType) {
    self.factory = factory
    self.router = router
  }
  
  func start() {
    showLogin()
  }
}

// MARK: - Private funcs
extension LoginCoordinator {
  private func showLogin() {
    let loginOutput = factory.makeLoginController()
    router.setRoot(module: loginOutput)
  }
}
