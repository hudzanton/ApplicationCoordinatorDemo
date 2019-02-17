//
//  ModuleFactoryType.swift
//  ApplicationCoordinatorDemo
//
//  Created by Anton Hudz on 2/14/19.
//  Copyright © 2019 Anton Hudz. All rights reserved.
//

import UIKit

protocol Flow1ModuleFactoryType {
  func makeControllerA() -> ControllerAOutput
}

protocol Flow2ModuleFactoryType {
  func makeControllerB() -> ControllerBOutput
  func makeControllerC() -> ControllerCOutput
}
