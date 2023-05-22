//
//  Flower.swift
//  FlowrSpot
//
//  Created by Borut Tomazin on 16/11/2020.
//  Copyright © 2022 Povio Inc. All rights reserved.
//

import Foundation

struct Flower: Identifiable {
  let id: String
  let name: String
  let latinName: String
  let genus: String?
  let sightingsCount: Int
  let pictureUrl: URL?
  let isFavorite: Bool
}

extension Flower: Hashable {
  static func == (lhs: Flower, rhs: Flower) -> Bool {
    lhs.id == rhs.id
  }
}
