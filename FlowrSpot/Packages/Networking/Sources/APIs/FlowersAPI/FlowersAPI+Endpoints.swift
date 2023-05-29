//
//  FlowersAPI+Endpoints.swift
//  FlowrSpot
//
//  Created by Borut Tomazin on 16/11/2020.
//  Copyright © 2022 Povio Inc. All rights reserved.
//

import Foundation

extension FlowersAPI {
  enum Endpoints: EndpointEncodable {
    case list
    case details(flowerid: String)
    
    var path: Path {
      switch self {
      case .list:
        return "flowers"
      case .details(let flowerid):
        return "flowers/\(String(flowerid))"
      }
    }
  }
}
