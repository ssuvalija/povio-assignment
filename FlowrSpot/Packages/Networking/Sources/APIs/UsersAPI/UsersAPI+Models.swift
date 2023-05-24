//
//  UsersAPI+Models.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 22/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import Foundation

public extension UsersAPI {
  struct UserDto: Decodable {
    public let id: String
    public let firstName: String
    public let lastName: String
    public let pictureUrl: String?
  }
}
