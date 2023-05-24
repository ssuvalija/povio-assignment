//
//  User.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 22/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import Foundation

struct User: Identifiable {
  let id: String
  let firstName: String
  let lastName: String
  let profilePictureUrl: URL?
}

extension User: Hashable {
  static func == (lhs: User, rhs: User) -> Bool {
    lhs.id == rhs.id
  }
}
