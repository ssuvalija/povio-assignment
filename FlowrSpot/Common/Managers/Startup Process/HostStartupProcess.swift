//
//  HostStartupProcess.swift
//  FlowrSpot
//
//  Created by Borut Tomazin on 04/01/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import Networking
import PovioKit

final class HostStartupProcess: StartupProcess {
  func run(completion: @escaping (Bool) -> Void) {
    switch Constants.Environment.current {
    case .dev:
      Host.current = .dev
    case .prod:
      Host.current = .prod
    }
    
    completion(true)
  }
}
