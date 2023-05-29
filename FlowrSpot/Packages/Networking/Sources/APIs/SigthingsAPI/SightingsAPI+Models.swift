//
//  SightingsAPI+Models.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 22/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import Foundation

public extension SightingsAPI {
  struct SightingsDto: Decodable {
    let items: [SightingDto]
  }
  
  struct SightingDto: Decodable {
    public let id: String
    public let name: String
    public let description: String
    public let pictureUrl: String?
    public let likeCount: Int
    public let commentCount: Int
    public let authorId: String
    public let flowerId: String
    public let latitude: Double
    public let longitude: Double
  }
}
