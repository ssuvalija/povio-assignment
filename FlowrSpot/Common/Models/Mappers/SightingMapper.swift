//
//  SightingMapper.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 23/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import Foundation
import Networking

struct SightingMapper: ModelMapper {
  static func transform(response: SightingsAPI.SightingDto) -> Sighting? {
    .init(id: response.id,
          name: response.name,
          description: response.description,
          likesCount: response.likeCount,
          commentsCount: response.commentCount,
          pictureUrl: URL(string: response.pictureUrl),
          latitude: response.latitude,
          longitude: response.longitude,
          authorId: response.authorId,
          flowerId: response.flowerId)
  }
}
