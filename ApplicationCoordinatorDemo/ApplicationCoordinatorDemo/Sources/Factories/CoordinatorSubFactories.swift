//
//  CoordinatorSubFactoryType.swift
//  ApplicationCoordinatorDemo
//
//  Created by Anton Hudz on 2/14/19.
//  Copyright © 2019 Anton Hudz. All rights reserved.
//

import UIKit

protocol CoordinatorSubFactoryType {
  var moduleFactory: ModuleFactory { get }
  var component: ComponentFactoryType { get }
}
