//
//  UIKitExtensions.swift
//  ApplicationCoordinatorDemo
//
//  Created by Anton Hudz on 2/14/19.
//  Copyright © 2019 Anton Hudz. All rights reserved.
//

import UIKit

enum Storyboard: String {
  case loginFlow = "Login"
}

extension UIStoryboard {
  convenience init(_ story: Storyboard) {
    self.init(name: story.rawValue, bundle: nil)
  }
  
  func instantiateController<T: UIViewController>() -> T {
    guard let viewController = self.instantiateViewController(withIdentifier: T.identifier) as? T else {
      fatalError("Could not load view controller with identifier\(T.identifier)")
    }
    return viewController
  }
}

protocol StoryboardType {
  static var identifier: String { get }
}

extension StoryboardType where Self: UIViewController {
  static var identifier: String {
    return String(describing: self)
  }
}

protocol PresentType {
  var toPresent: UIViewController? { get }
}

extension UIViewController: StoryboardType {}
extension UIViewController: PresentType {
  var toPresent: UIViewController? {
    return self
  }
}
