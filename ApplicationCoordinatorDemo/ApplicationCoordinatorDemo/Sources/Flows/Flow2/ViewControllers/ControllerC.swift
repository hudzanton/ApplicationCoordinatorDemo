//
//  ControllerC.swift
//  ApplicationCoordinatorDemo
//
//  Created by Anton Hudz on 2/17/19.
//  Copyright © 2019 Anton Hudz. All rights reserved.
//

protocol ControllerCOutput: BaseViewType {
  var onBack: (() -> Void)? { get set }
}

final class ControllerC: BaseViewController, ControllerCOutput {
  
  // MARK: - Output
  var onBack: (() -> Void)?
  
  // MARK: - Actions
  @IBAction private func backAction() {
    onBack?()
  }
}
