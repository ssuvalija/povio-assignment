//
//  FlowersAPI.swift
//  FlowrSpot
//
//  Created by Borut Tomazin on 16/11/2020.
//  Copyright © 2022 Povio Inc. All rights reserved.
//

import Foundation
import PovioKitNetworking
import PovioKitPromise

public protocol FlowersService {
  func fetchFlowersList() -> Promise<[FlowersAPI.FlowerDto]>
  func fetchFlowerDetails(flowerId: Int) -> Promise<FlowersAPI.FlowerDto>
}

public final class FlowersAPI {
  private let client: AlamofireNetworkClient
  
  public init(client: AlamofireNetworkClient = .default) {
    self.client = client
  }
}

extension FlowersAPI: FlowersService {
  public func fetchFlowersList() -> Promise<[FlowerDto]> {
    client
      .request(method: .get, endpoint: Endpoints.list)
      .validate()
      .decode(FlowersDto.self, decoder: .default)
      .map { $0.items }
  }
  
  public func fetchFlowerDetails(flowerId: Int) -> Promise<FlowerDto> {
    client
      .request(method: .get, endpoint: Endpoints.details(flowerid: flowerId))
      .validate()
      .decode(FlowerDto.self, decoder: .default)
  }
}
