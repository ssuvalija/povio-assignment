//
//  UsersAPI.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 22/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import Foundation
import PovioKitNetworking
import PovioKitPromise

public protocol UsersService {
  func fetchUserDetails(userId: String) -> Promise<UsersAPI.UserDto>
}

public final class UsersAPI {
  private let client: AlamofireNetworkClient
  
  public init(client: AlamofireNetworkClient = .default) {
    self.client = client
  }
}

extension UsersAPI: UsersService {
  public func fetchUserDetails(userId: String) -> Promise<UsersAPI.UserDto> {
    client
      .request(method: .get, endpoint: Endpoints.details(userId: userId))
      .validate()
      .decode(UserDto.self, decoder: .default)
  }
}
