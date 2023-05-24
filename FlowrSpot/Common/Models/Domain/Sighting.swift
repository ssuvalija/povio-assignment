//
//  Sighting.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 22/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import Foundation

struct Sighting: Identifiable {
  let id: String
  let name: String
  let description: String
  let likesCount: Int
  let commentsCount: Int
  let pictureUrl: URL?
  let latitude: Double
  let longitude: Double
  let authorId: String
  let flowerId: String
  var location: String?
  
  var user: User?
  var flower: Flower?
}

extension Sighting: Hashable {
  static func == (lhs: Sighting, rhs: Sighting) -> Bool {
    lhs.id == rhs.id
  }
}
