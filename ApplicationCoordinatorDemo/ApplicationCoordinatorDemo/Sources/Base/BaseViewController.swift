//
//  BaseViewController.swift
//  ApplicationCoordinatorDemo
//
//  Created by Anton Hudz on 2/14/19.
//  Copyright © 2019 Anton Hudz. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, UIGestureRecognizerDelegate, UINavigationControllerDelegate {
  override func viewDidLoad() {
    super.viewDidLoad()

    navigationController?.isNavigationBarHidden = true
  }

  deinit {
    print(String(describing: self))
  }

  override var prefersStatusBarHidden: Bool {
    return false
  }

  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .default
  }
}
