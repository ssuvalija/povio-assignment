//
//  FlowerMapper.swift
//  FlowrSpot
//
//  Created by Borut Tomazin on 04/01/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import Foundation
import Networking

struct FlowerMapper: ModelMapper {
  static func transform(response: FlowersAPI.FlowerDto) -> Flower? {
    .init(id: response.id,
          name: response.name,
          latinName: response.latinName,
          genus: response.genus,
          sightingsCount: response.sightingsNum ?? 0,
          pictureUrl: URL(string: "\(Host.current.baseURL)\(response.pictureUrl)"),
          isFavorite: false)
  }
}
