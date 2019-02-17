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
extension ModuleFactory: Flow1ModuleFactoryType {
  func makeControllerA() -> ControllerAOutput {
    let controller = UIStoryboard(.flow1).instantiateController() as ControllerA
    return controller
  }
}

extension ModuleFactory: Flow2ModuleFactoryType {
  func makeControllerB() -> ControllerBOutput {
    let controller = UIStoryboard(.flow2).instantiateController() as ControllerB
    return controller
  }
  
  func makeControllerC() -> ControllerCOutput {
    let controller = UIStoryboard(.flow2).instantiateController() as ControllerC
    return controller
  }
}
