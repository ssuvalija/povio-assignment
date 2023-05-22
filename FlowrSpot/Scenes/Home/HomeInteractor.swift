//
//  HomeInteractor.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 16/01/2018.
//  Copyright © 2022 Povio Inc. All rights reserved.
//

import Foundation
import Networking

protocol HomeBusinessLogic {
  func fetchFlowers()
}

final class HomeInteractor {
  var presenter: HomePresentationLogic?
  private let flowersAPI: FlowersAPI
  
  init(flowersAPI: FlowersAPI = .init()) {
    self.flowersAPI = flowersAPI
  }
}

// MARK: - Business Logic
extension HomeInteractor: HomeBusinessLogic {
  func fetchFlowers() {
    flowersAPI
      .fetchFlowersList()
      .map { FlowerMapper.map(response: $0) }
      .finally { [weak self] in self?.presenter?.presentFlowersResult($0) }
  }
}
