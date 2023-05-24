//
//  SightingsRouter.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 28/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import UIKit

protocol SightingsRoutingLogic {
  func navigateToSightingDetails(sighting: Sighting)
  func navigateToAlert(title: String, message: String, handler: (() -> Void)?)
  func navigateToSightingComments(sighting: Sighting)
  func navigateToSightingFavorites(sighting: Sighting)
  func navigateToSightingLocation(sighting: Sighting)
  func navigateToAddNewSighting()
}

final class SightingsRouter {
  weak var viewController: SightingsViewController?
}

// MARK: - Routing Logic
extension SightingsRouter: SightingsRoutingLogic {
  func navigateToSightingDetails(sighting: Sighting) {
    // TODO: - Implement sighting details
  }
  
  func navigateToAlert(title: String, message: String, handler: (() -> Void)?) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "general_ok".localized(), style: .cancel) { _ in handler?() })
    viewController?.present(alert, animated: true, completion: nil)
  }
  
  func navigateToSightingComments(sighting: Sighting) {
    // TODO: - Implement sighting comments
  }
  
  func navigateToSightingFavorites(sighting: Sighting) {
    // TODO: - Implement sighting likes
  }
  
  func navigateToSightingLocation(sighting: Sighting) {
    // TODO: - Implement sighting location
  }
  
  func navigateToAddNewSighting() {
    // TODO: - Implement add new sighting
  }
}
