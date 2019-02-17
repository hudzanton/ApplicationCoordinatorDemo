//
//  ControllerA.swift
//  ApplicationCoordinatorDemo
//
//  Created by Anton Hudz on 2/14/19.
//  Copyright © 2019 Anton Hudz. All rights reserved.
//

protocol ControllerAOutput: BaseViewType {
  var onFinishFlow: (() -> Void)? { get set }
}

final class ControllerA: BaseViewController, ControllerAOutput {
  
  // MARK: - Output
  var onFinishFlow: (() -> Void)?
  
  // MARK: - Actions
  @IBAction private func finishFlowAction() {
    onFinishFlow?()
  }
  
}
