//
//  SightingsAPI.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 22/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import Foundation
import PovioKitNetworking
import PovioKitPromise

public protocol SightingsService {
  func fetchSightingsList() -> Promise<[SightingsAPI.SightingDto]>
}

public final class SightingsAPI {
  private let client: AlamofireNetworkClient
  
  public init(client: AlamofireNetworkClient = .default) {
    self.client = client
  }
}

extension SightingsAPI: SightingsService {
  public func fetchSightingsList() -> Promise<[SightingsAPI.SightingDto]> {
    client
      .request(method: .get, endpoint: Endpoints.list)
      .validate()
      .decode(SightingsDto.self, decoder: .default)
      .map { $0.items }
  }
}
