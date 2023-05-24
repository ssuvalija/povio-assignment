//
//  SightingsAPI+Endpoints.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 22/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import Foundation

extension SightingsAPI {
  enum Endpoints: EndpointEncodable {
    case list
    
    var path: Path {
      switch self {
      case .list:
        return "sightings"
      }
    }
  }
}
