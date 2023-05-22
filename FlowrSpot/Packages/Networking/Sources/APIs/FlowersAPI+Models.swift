//
//  FlowersAPI+Mappers.swift
//  FlowrSpot
//
//  Created by Borut Tomazin on 20/11/2020.
//  Copyright © 2022 Povio Inc. All rights reserved.
//

import Foundation

public extension FlowersAPI {
  struct FlowersDto: Decodable {
    let items: [FlowerDto]
  }
  
  struct FlowerDto: Decodable {
    public let id: String
    public let name: String
    public let latinName: String
    public let genus: String?
    public let pictureUrl: String
    public let sightingsNum: Int
    public let authorId: String
//    public let favorite: Bool
  }
}
