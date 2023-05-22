//
//  FlowController.swift
//  FlowrSpot
//
//  Created by Borut Tomazin on 08/10/2021.
//  Copyright © 2022 Povio Inc. All rights reserved.
//

import UIKit

final class FlowController {
  let window: UIWindow
  
  init(window: UIWindow) {
    self.window = window
    self.window.makeKeyAndVisible()
  }
}

// MARK: - Public Methods
extension FlowController {
  func startAppFlow() {
    window.rootViewController = TabBarController()
  }
}
