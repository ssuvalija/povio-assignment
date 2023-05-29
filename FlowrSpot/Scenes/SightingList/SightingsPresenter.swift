//
//  SightingsPresenter.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 22/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import UIKit

protocol SightingsPresentationLogic {
  func presentSightings(_ result: Result<[Sighting], Error>)
  func displayProgressView()
}

final class SightingsPresenter {
  weak var viewController: SightingsDisplayLogic?
}

extension SightingsPresenter: SightingsPresentationLogic {
  func presentSightings(_ result: Result<[Sighting], Error>) {
    viewController?.hideProgressView()
    switch result {
    case .success(let sightings):
      viewController?.displaySightings(sightings)
    case .failure(let error):
      viewController?.displayError(title: "general_error".localized(), message: error.localizedDescription)
    }
  }
  
  func displayProgressView() {
    viewController?.displayProgressView()
  }
}
