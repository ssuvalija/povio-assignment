//
//  SightingsDataSource.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 23/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import Foundation
import OrderedCollections
import UIKit

final class SightingsDataSource {
  typealias Section = SightingsSection
  typealias Row = AnyHashable
  typealias DataSource = UITableViewDiffableDataSource<Section, Row>
  typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Row>
  
  private var diffableDataSource: DataSource?
  private var sightings = OrderedSet<Sighting>()
}

// MARK: - Public methods
extension SightingsDataSource {
  func update(sightings: [Sighting]) {
    for sighting in sightings {
      self.sightings.updateOrAppend(sighting)
    }
    build(animated: true)
  }
  
  func row(at indexPath: IndexPath) -> Row? {
    diffableDataSource?.itemIdentifier(for: indexPath)
  }
  
  func create(with tableView: UITableView, delegate: SightingTableViewCellDelegate) -> DataSource? {
    diffableDataSource = DataSource(tableView: tableView) { tableView, indexPath, row in
      switch row {
      case let sightingsRow as SightingsRow:
        let cell = tableView.dequeueReusableCell(SightingTableViewCell.self, at: indexPath)
        cell.update(with: sightingsRow)
        cell.delegate = delegate
        return cell
      case _:
        return nil
      }
    }
    return diffableDataSource
  }
}

// MARK: - Private methods
private extension SightingsDataSource {
  func build(animated: Bool) {
    let rows: [SightingsRow] = sightings.map(SightingsRow.init)
    
    var snapshot = Snapshot()
    snapshot.appendSections(Section.allCases)
    snapshot.appendItems(rows)
    diffableDataSource?.apply(snapshot, animatingDifferences: animated)
  }
}
