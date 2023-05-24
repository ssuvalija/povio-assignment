//
//  LocationManager.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 28/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import CoreLocation
import Foundation

enum LocationManager {
  static func getCityFromCoordinates(latitude: Double, longitude: Double) -> Promise<String> {
    Promise<String> { seal in
      CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))) { placemarks, error in
        if let error = error {
          seal.reject(with: error)
        } else if let placemarks = placemarks, let placemark = placemarks.first, let locality = placemark.locality {
          var location = locality
          if let area = placemark.administrativeArea, area != location {
            location += ", \(area)"
          } else if let country = placemark.country {
            location += ", \(country)"
          }
          seal.resolve(with: .success(location))
        } else {
          seal.resolve(with: .success("unknown_location".localized()))
        }
      }
    }
  }
}
