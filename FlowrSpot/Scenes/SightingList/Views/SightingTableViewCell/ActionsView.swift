//
//  ActionsView.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 25/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import Foundation
import UIKit

protocol ActionsViewDelegate: AnyObject {
  func didTapOnCommentsButton()
  func didTapOnFavoritesButton()
}

final class ActionsView: UIView {
  weak var delegate: ActionsViewDelegate?
  private let stackView = UIStackView()
  private let favoritesButton = UIButton()
  private let commentsButton = UIButton()
  let placeholderView = UIView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func update(with row: SightingsRow) {
    favoritesButton.setTitle("favorites_count".localized(row.likesCount), for: .normal)
    commentsButton.setTitle("comments_count".localized(row.commentsCount), for: .normal)
  }
}

private extension ActionsView {
  func setupViews() {
    setupStackView()
  }
  
  func setupLikesButton() {
    stackView.addArrangedSubview(favoritesButton)
    
    let likesButtonConfig = ActionButtonConfiguration(imageName: "slFavoriteIcon")
    favoritesButton.configureAsActionButton(configuration: likesButtonConfig)
    favoritesButton.addTarget(self, action: #selector(didTapOnFavoritesButton), for: .touchUpInside)
  }
  
  func setupCommentsButton() {
    stackView.addArrangedSubview(commentsButton)
    
    let commentsButtonConfig = ActionButtonConfiguration(imageName: "slCommentIcon")
    commentsButton.configureAsActionButton(configuration: commentsButtonConfig)
    commentsButton.addTarget(self, action: #selector(didTapOnCommentsButton), for: .touchUpInside)
  }
  
  func setupPlaceholderView() {
    placeholderView.snp.makeConstraints {
      $0.width.equalTo(50)
    }
    stackView.addArrangedSubview(placeholderView)
  }
  
  func setupStackView() {
    addSubview(stackView)
    
    setupCommentsButton()
    setupLikesButton()
    setupPlaceholderView()
    
    stackView.axis = .horizontal
    stackView.alignment = .center
    stackView.distribution = .fillProportionally
    stackView.spacing = 20
    stackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    stackView.isLayoutMarginsRelativeArrangement = true
    
    stackView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}

private extension ActionsView {
  @objc func didTapOnCommentsButton() {
    self.delegate?.didTapOnCommentsButton()
  }
  
  @objc func didTapOnFavoritesButton() {
    self.delegate?.didTapOnFavoritesButton()
  }
}
