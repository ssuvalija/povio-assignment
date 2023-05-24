//
//  SightingsContentView.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 22/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import Foundation
import UIKit

final class SightingsContentView: UIView {
  let headerViewHeight: CGFloat = 119
  let headerView = SightingsHeaderView()
  let tableView = UITableView(frame: .zero, style: .plain)
  let footerView = SightingsFooterView(frame: CGRect(x: 0, y: 0, width: UIScreen.width(), height: 98))
  let emptyView = EmptyView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

private extension SightingsContentView {
  func setupViews() {
    backgroundColor = .white
    setupTableView()
    setupEmptyView()
    setupHeaderView()
  }
  
  func setupTableView() {
    addSubview(tableView)
    
    tableView.backgroundColor = .white
    tableView.separatorStyle = .none
    tableView.estimatedRowHeight = 360
    tableView.rowHeight = UITableView.automaticDimension
    tableView.register(SightingTableViewCell.self)
    tableView.contentInset = UIEdgeInsets(top: headerViewHeight, left: 0, bottom: 0, right: 0)
    tableView.tableFooterView = footerView
    tableView.showsVerticalScrollIndicator = false
    
    tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  func setupEmptyView() {
    addSubview(emptyView)
    emptyView.text = "placeholder_no_content".localized()
    emptyView.backgroundColor = .white
    emptyView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
  }
  
  func setupHeaderView() {
    addSubview(headerView)
    headerView.snp.makeConstraints {
      $0.leading.top.trailing.equalToSuperview()
      $0.height.equalTo(headerViewHeight)
    }
  }
}

extension SightingsContentView {
  func onScroll(offset: CGFloat) {
    let percentage = 1 - (-offset / headerViewHeight)
    
    var headerViewTranslation = -percentage * headerViewHeight
    if headerViewTranslation > 0 {
      headerViewTranslation = 0 // lock headerView
    }
    
    headerView.transform = .identity.translatedBy(x: 0, y: headerViewTranslation)
  }
}
