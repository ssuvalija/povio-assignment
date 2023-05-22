//
//  HomePresenter.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 16/01/2018.
//  Copyright © 2022 Povio Inc. All rights reserved.
//

import UIKit

protocol HomePresentationLogic {
  func presentFlowersResult(_ result: Result<[Flower], Error>)
}

final class HomePresenter {
  weak var viewController: HomeDisplayLogic?
}

// MARK: - Presentation Logic
extension HomePresenter: HomePresentationLogic {
  func presentFlowersResult(_ result: Result<[Flower], Error>) {
    switch result {
    case .success(let flowers):
      viewController?.displayFlowers(flowers)
    case .failure(let error):
      viewController?.displayError(title: "general_error".localized(),
                                   message: error.localizedDescription)
    }
  }
}
