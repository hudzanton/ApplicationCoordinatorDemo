//
//  AppDelegate.swift
//  ApplicationCoordinatorDemo
//
//  Created by Anton Hudz on 2/14/19.
//  Copyright © 2019 Anton Hudz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  private let coordinatorFactory = CoordinatorFactory()
  private lazy var applicationCoordinator: ApplicationCoordinatorOutput = self.makeApplicationCoordinator()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    configureWindow()
    return true
  }
}

// MARK: - Private funcs
extension AppDelegate {
  private func configureWindow() {
    window = UIWindow(frame: UIScreen.main.bounds)
    applicationCoordinator.start()
  }
  
  private func makeApplicationCoordinator() -> ApplicationCoordinatorOutput {
    return self.coordinatorFactory.makeApplicationCoordinator(window: window!)
  }
}
