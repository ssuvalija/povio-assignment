//
//  Environment.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 22/01/2018.
//  Copyright © 2022 Povio Inc. All rights reserved.
//

import Foundation

enum Constants {
  enum Environment: String {
    case dev
    case prod
    
    #if DEBUG
    static let isDebug = true
    #else
    static let isDebug = false
    #endif
    
#if PRODUCTION
    static let current = Environment.prod
#else
    static let current = Environment.dev
#endif
    
    static let isTesting = ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
  }
}
