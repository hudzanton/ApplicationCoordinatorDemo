//
//  ControllerB.swift
//  ApplicationCoordinatorDemo
//
//  Created by Anton Hudz on 2/17/19.
//  Copyright © 2019 Anton Hudz. All rights reserved.
//

protocol ControllerBOutput: BaseViewType {
  var onFinishFlow: (() -> Void)? { get set }
  var onNext: (() -> Void)? { get set }
}

final class ControllerB: BaseViewController, ControllerBOutput {
  
  // MARK: - Output
  var onFinishFlow: (() -> Void)?
  var onNext: (() -> Void)?
  
  // MARK: - Actions
  @IBAction private func nextAction() {
    onNext?()
  }
  
  @IBAction private func finishFlowAction() {
    onFinishFlow?()
  }
}
