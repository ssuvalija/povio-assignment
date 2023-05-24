//
//  SightingListViewController.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 22/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import UIKit

protocol SightingsDisplayLogic: AnyObject {
  func displaySightings(_ sightings: [Sighting])
  func displayError(title: String, message: String)
  func displayProgressView()
  func hideProgressView()
}

final class SightingsViewController: BaseFlowrSpotViewController {
  var interactor: SightingListBussinessLogic?
  var router: SightingsRoutingLogic?
  
  private lazy var contentView = SightingsContentView()
  private let rightBarButton = UIButton(type: .custom)
  private let loader = UIActivityIndicatorView(style: .medium)
  private let dataSource = SightingsDataSource()
  
  init() {
    super.init(nibName: nil, bundle: nil)
    let interactor = SightingsInteractor()
    let presenter = SightingsPresenter()
    let router = SightingsRouter()
    interactor.presenter = presenter
    presenter.viewController = self
    router.viewController = self
    self.interactor = interactor
    self.router = router
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.interactor?.fetchSightings()
  }
  
  override func loadView() {
    view = contentView
  }
}

// MARK: - Display logic
extension SightingsViewController: SightingsDisplayLogic {
  func displaySightings(_ sightings: [Sighting]) {
    dataSource.update(sightings: sightings)
    contentView.tableView.reloadData()
    contentView.emptyView.isHidden = true
  }
  
  func displayError(title: String, message: String) {
    contentView.emptyView.isHidden = false
    router?.navigateToAlert(title: title, message: message, handler: nil)
  }
  
  func displayProgressView() {
    loader.startAnimating()
  }
  
  func hideProgressView() {
    loader.stopAnimating()
  }
}

// MARK: - UI setup
private extension SightingsViewController {
  func setupViews() {
    setupContentView()
    setupLoader()
    setupRightBarButton()
  }
  
  func setupContentView() {
    contentView.tableView.dataSource = dataSource.create(with: contentView.tableView, delegate: self)
    contentView.tableView.delegate = self
    contentView.footerView.delegate = self
  }
  
  func setupRightBarButton() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBarButton)
    rightBarButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
    rightBarButton.tintColor = .textScondary
    rightBarButton.addTarget(self, action: #selector(barButtonPressed), for: .touchUpInside)
  }
  
  func setupLoader() {
    view.addSubview(loader)
    loader.color = .textScondary
    loader.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
  }
}

// MARK: - Scroll View Delegate
extension SightingsViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    contentView.onScroll(offset: scrollView.contentOffset.y)
  }
}

// MARK: - Table View Delegate
extension SightingsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let row = dataSource.row(at: indexPath) else {
      Logger.error("No availible row in dataSource at \(indexPath)")
      return
    }
    switch row {
    case let sightingRow as SightingsRow:
      router?.navigateToSightingDetails(sighting: sightingRow.entity)
    case _:
      break
    }
  }
}

// MARK: - Sighting Cell Delegate
extension SightingsViewController: SightingTableViewCellDelegate {
  private func performActionForSightingItem(inCell cell: UITableViewCell, action: (Sighting) -> Void) {
    if let indexPath = contentView.tableView.indexPath(for: cell),
       let sightingRow = dataSource.row(at: indexPath) as? SightingsRow {
      action(sightingRow.entity)
    }
  }
  
  func showSightingLocation(sender: UITableViewCell) {
    performActionForSightingItem(inCell: sender) {
      router?.navigateToSightingLocation(sighting: $0)
    }
  }
  
  func showSightingComments(sender: UITableViewCell) {
    performActionForSightingItem(inCell: sender) {
      router?.navigateToSightingComments(sighting: $0)
    }
  }
  
  func showSightingFavorites(sender: UITableViewCell) {
    performActionForSightingItem(inCell: sender) {
      router?.navigateToSightingFavorites(sighting: $0)
    }
  }
}

// MARK: - Sighting Footer Delegate
extension SightingsViewController: SightingsFooterDelegate {
  func addNewSighting() {
    router?.navigateToAddNewSighting()
  }
}

// MARK: - Navigation Bar Actions
private extension SightingsViewController {
  @objc func barButtonPressed() {
    // TODO: implement action
  }
}
