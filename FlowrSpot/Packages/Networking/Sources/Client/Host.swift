//
//  Host.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 19/01/2018.
//  Copyright © 2022 Povio Inc. All rights reserved.
//

import Foundation

public enum Host {
  case dev
  case prod
}

public extension Host {
  var baseURL: String {
    switch self {
    case .dev:
      return "https://example.flowrspot.povio-projects.online"
    case .prod:
      return "{to-update}"
    }
  }
  
  static var current: Host = .dev
}
