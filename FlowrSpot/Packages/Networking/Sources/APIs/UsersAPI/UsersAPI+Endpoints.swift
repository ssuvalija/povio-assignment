//
//  UsersAPI+Endpoints.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 22/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import Foundation

extension UsersAPI {
  enum Endpoints: EndpointEncodable {
    case details(userId: String)
    
    var path: Path {
      switch self {
      case .details(let id):
        return "users/\(id)"
      }
    }
  }
}
