//
//  ModuleFactory.swift
//  ApplicationCoordinatorDemo
//
//  Created by Anton Hudz on 2/14/19.
//  Copyright © 2019 Anton Hudz. All rights reserved.
//

import UIKit

final class ModuleFactory {
  
  // MARK: - Private properties
  private let component: ComponentFactoryType

  // MARK: - Init
  init(component: ComponentFactoryType) {
    self.component = component
  }
}

// MARK: - Public funcs
extension ModuleFactory: LoginModuleFactoryType {
  func makeLoginController() -> LoginOutput {
    let controller = UIStoryboard(.loginFlow).instantiateController() as LoginController
    return controller
  }
}
