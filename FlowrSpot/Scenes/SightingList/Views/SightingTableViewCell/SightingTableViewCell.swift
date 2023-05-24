//
//  SightingTableViewCell.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 23/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import Foundation
import PovioKit
import PovioKitUI
import UIKit

protocol SightingTableViewCellDelegate: AnyObject {
  func showSightingLocation(sender: UITableViewCell)
  func showSightingComments(sender: UITableViewCell)
  func showSightingFavorites(sender: UITableViewCell)
}

final class SightingTableViewCell: UITableViewCell {
  weak var delegate: SightingTableViewCellDelegate?
  
  private static let flowerImageHeight = 280
  
  private let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: Int(UIScreen.width()), height: flowerImageHeight))
  private let flowerTitleLabel = UILabel()
  private let flowerSubtitleLabel = UILabel()
  private let flowerTitleStackView = UIStackView()
  
  private let locationButton = UIButton(type: .roundedRect)
  
  private let sightingTitleView = SightingTitleView()
  private let sightingDescriptionLabel = PaddingLabel()
  
  private let bottomStackView = UIStackView()
  private let actionsView = ActionsView()
  
  private let separatorView = UIView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension SightingTableViewCell {
  func update(with row: SightingsRow) {
    flowerTitleLabel.text = row.flowerName
    flowerSubtitleLabel.text = row.latinFlowerName
    backgroundImageView.setImage(with: row.pictureUrl, placeholder: UIImage(named: "plImage"))
    locationButton.setTitle(row.location, for: .normal)
    sightingTitleView.update(with: row)
    sightingDescriptionLabel.text = row.sightingDescription
    actionsView.update(with: row)
    
    locationButton.snp.updateConstraints {
      $0.width.equalTo(locationButton.intrinsicContentSize.width + 30)
    }
  }
}

private extension SightingTableViewCell {
  func setupViews() {
    contentView.backgroundColor = .white
    setupCellHeader()
    setupCellBottom()
  }
  
  func setupCellHeader() {
    setupBackgroundImageView()
    setupFlowerTitleStackView()
    setupLocationButton()
  }
  
  func setupCellBottom() {
    setupSightingTitleView()
    setupBottomStackView()
    setupActionsView()
  }
  
  func setupBackgroundImageView() {
    contentView.addSubview(backgroundImageView)
    backgroundImageView.kf.indicatorType = .activity
    backgroundImageView.contentMode = .scaleAspectFill
    backgroundImageView.clipsToBounds = true
    backgroundImageView.addGradient(startColor: .clear, endColor: .black, opacity: 0.8)
    backgroundImageView.isUserInteractionEnabled = true
    
    backgroundImageView.snp.makeConstraints {
      $0.leading.trailing.top.equalToSuperview()
      $0.height.greaterThanOrEqualTo(SightingTableViewCell.flowerImageHeight)
    }
  }
  
  func setupFlowerTitleStackView() {
    func setupTitleLabel() {
      flowerTitleStackView.addArrangedSubview(flowerTitleLabel)
      flowerTitleLabel.font = .custom(type: .regular, size: 20)
      flowerTitleLabel.textColor = .white
      flowerTitleLabel.textAlignment = .center
    }
    
    func setupSubtitleLabel() {
      flowerTitleStackView.addArrangedSubview(flowerSubtitleLabel)
      flowerSubtitleLabel.font = .custom(type: .italic, size: 12)
      flowerSubtitleLabel.textColor = .white
      flowerSubtitleLabel.textAlignment = .center
      flowerSubtitleLabel.alpha = 0.7
    }
    setupTitleLabel()
    setupSubtitleLabel()
    backgroundImageView.addSubview(flowerTitleStackView)
    flowerTitleStackView.axis = .vertical
    flowerTitleStackView.spacing = 7
    flowerTitleStackView.alignment = .center
    flowerTitleStackView.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(16)
      $0.trailing.equalToSuperview().offset(-16)
      $0.bottom.equalToSuperview().offset(-30)
    }
  }
  
  func setupLocationButton() {
    backgroundImageView.addSubview(locationButton)
    
    let locationButtonConfig = ActionButtonConfiguration(imageName: "pl-icon-location-small",
                                                         titleColor: .flowrPink,
                                                         buttonHeight: 25,
                                                         backgroundColor: .white,
                                                         cornerRadius: 12)
    
    locationButton.configureAsActionButton(configuration: locationButtonConfig)
    locationButton.addTarget(self, action: #selector(didTapOnLocationButton), for: .touchUpInside)
    
    locationButton.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(20)
      $0.top.equalToSuperview().offset(20)
      $0.height.equalTo(25)
      $0.width.equalTo(locationButton.intrinsicContentSize.width + 30)
    }
  }
  
  func setupSightingTitleView() {
    contentView.addSubview(sightingTitleView)
    
    sightingTitleView.snp.makeConstraints {
      $0.top.equalTo(backgroundImageView.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(80)
    }
  }
  
  func setupSightingDescriptionLabel() {
    bottomStackView.addArrangedSubview(sightingDescriptionLabel)
    
    sightingDescriptionLabel.textAlignment = .justified
    sightingDescriptionLabel.textColor = .textScondary
    sightingDescriptionLabel.lineBreakMode = .byTruncatingTail
    sightingDescriptionLabel.numberOfLines = 0
    sightingDescriptionLabel.font = .custom(type: .regular, size: 13)
    sightingDescriptionLabel.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
    sightingDescriptionLabel.snp.makeConstraints {
      $0.height.lessThanOrEqualTo(62)
    }
  }
  
  func setupSeparatorView() {
    bottomStackView.addArrangedSubview(separatorView)
    
    separatorView.backgroundColor = .separatorGray
    separatorView.snp.makeConstraints {
      $0.height.equalTo(1)
    }
  }
  
  func setupBottomStackView() {
    contentView.addSubview(bottomStackView)
    
    setupSightingDescriptionLabel()
    setupSeparatorView()
    
    bottomStackView.axis = .vertical
    bottomStackView.spacing = 20
    bottomStackView.backgroundColor = .white
    bottomStackView.layoutMargins = UIEdgeInsets(top: 0, left: 27, bottom: 0, right: 27)
    bottomStackView.isLayoutMarginsRelativeArrangement = true
    
    bottomStackView.snp.makeConstraints {
      $0.top.equalTo(sightingTitleView.snp.bottom)
      $0.leading.trailing.equalToSuperview()
    }
  }
  
  func setupActionsView() {
    actionsView.delegate = self
    contentView.addSubview(actionsView)
    
    actionsView.snp.makeConstraints {
      $0.top.equalTo(bottomStackView.snp.bottom).offset(20)
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalToSuperview().offset(-20)
    }
  }
}

extension SightingTableViewCell: ActionsViewDelegate {
  func didTapOnCommentsButton() {
    delegate?.showSightingComments(sender: self)
  }
  
  func didTapOnFavoritesButton() {
    delegate?.showSightingFavorites(sender: self)
  }
  
  @objc func didTapOnLocationButton() {
    delegate?.showSightingLocation(sender: self)
  }
}
