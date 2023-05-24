//
//  UserMapper.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 23/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import Foundation
import Networking

struct UserMapper: ModelMapper {
  static func transform(response: UsersAPI.UserDto) -> User? {
    .init(id: response.id,
          firstName: response.firstName,
          lastName: response.lastName,
          profilePictureUrl: URL(string: response.pictureUrl))
  }
}
