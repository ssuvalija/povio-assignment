//
//  SightingListInteractor.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 22/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import Foundation
import MapKit
import Networking
import PovioKitPromise

protocol SightingListBussinessLogic {
  func fetchSightings()
}

final class SightingsInteractor {
  var presenter: SightingsPresentationLogic?
  private let sightingsAPI: SightingsAPI
  private let usersAPI: UsersAPI
  private let flowersAPI: FlowersAPI
  
  init(sightingsAPI: SightingsAPI = .init(), usersAPI: UsersAPI = .init(), flowersAPI: FlowersAPI = .init()) {
    self.sightingsAPI = sightingsAPI
    self.usersAPI = usersAPI
    self.flowersAPI = flowersAPI
  }
}

extension SightingsInteractor: SightingListBussinessLogic {
  func fetchSightings() {
    presenter?.displayProgressView()
    sightingsAPI
      .fetchSightingsList()
      .map { SightingMapper.map(response: $0) }
      .flatMap(with: updateWithFlowerDetails)
      .flatMap(with: updateWithAuthorDetails)
      .flatMap(with: updateWithLocationDetails)
      .finally { result in
        self.presenter?.presentSightings(result)
      }
  }
}

private extension SightingsInteractor {
  func updateWithLocationDetails(_ sightings: [Sighting]) -> Promise<[Sighting]> {
    let coordinatePairs = sightings.map {
      (latitude: $0.latitude, longitude: $0.longitude)
    }
    
    let locationPromises: [Promise<String>] = coordinatePairs.map {
      LocationManager.getCityFromCoordinates(latitude: $0.latitude, longitude: $0.longitude)
    }
    
    var updatedSightings: [Sighting] = sightings
    
    return all(promises: locationPromises).map { locations -> [Sighting] in
      for (index, location) in locations.enumerated() {
        updatedSightings[index].location = location
      }
      
      return updatedSightings
    }
  }
  
  func updateWithFlowerDetails(_ sightings: [Sighting]) -> Promise<[Sighting]> {
    let flowerIds = Array(Set(sightings.map { $0.flowerId }))
    
    let flowerPromises: [Promise<FlowersAPI.FlowerDto>] = flowerIds.map {
      self.flowersAPI.fetchFlowerDetails(flowerId: $0)
    }
    
    var updatedSightings: [Sighting] = sightings
    
    return all(promises: flowerPromises).map { flowers -> [Sighting] in
      for flower in flowers {
        for index in updatedSightings.indices where updatedSightings[index].flowerId == flower.id {
          updatedSightings[index].flower = FlowerMapper.transform(response: flower)
        }
      }
      
      return updatedSightings
    }
  }
  
  func updateWithAuthorDetails(_ sightings: [Sighting]) -> Promise<[Sighting]> {
    let authorIds = Array(Set(sightings.map { $0.authorId }))
    
    let authorPromises: [Promise<UsersAPI.UserDto>] = authorIds.map {
      self.usersAPI.fetchUserDetails(userId: $0)
    }
    
    var updatedSightings: [Sighting] = sightings
    
    return all(promises: authorPromises).map { authors -> [Sighting] in
      for author in authors {
        for index in updatedSightings.indices where updatedSightings[index].authorId == author.id {
          updatedSightings[index].user = UserMapper.transform(response: author)
        }
      }
      
      return updatedSightings
    }
  }
}
