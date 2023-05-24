//
//  SightingsRow.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 23/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import Foundation

struct SightingsRow: Hashable {
  let entity: Sighting
}

extension SightingsRow {
  var sightingName: String { entity.name }
  var sightingDescription: String { entity.description }
  var pictureUrl: URL? { entity.pictureUrl }
  var likesCount: Int { entity.likesCount }
  var commentsCount: Int { entity.commentsCount }
  var longitude: Double { entity.longitude }
  var latitude: Double { entity.latitude }
  var location: String? { entity.location }
  var flowerName: String? { entity.flower?.name }
  var latinFlowerName: String? { entity.flower?.latinName }
  var authorProfilePictureUrl: URL? { entity.user?.profilePictureUrl }
}
