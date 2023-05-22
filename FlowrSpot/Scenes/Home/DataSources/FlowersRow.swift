//
//  FlowerRow.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 19/01/2018.
//  Copyright © 2022 Povio Inc. All rights reserved.
//

import Foundation

struct FlowersRow: Hashable {
  let entity: Flower
}

extension FlowersRow {
  var name: String { entity.name }
  var latinName: String { entity.latinName }
  var sightingsCount: String { "sightings_count".localized(entity.sightingsCount) }
  var pictureUrl: URL? { entity.pictureUrl }
}
