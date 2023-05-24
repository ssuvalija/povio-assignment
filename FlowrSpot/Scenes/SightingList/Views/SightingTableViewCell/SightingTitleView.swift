//
//  SightingTitleView.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 24/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import Foundation
import UIKit

final class SightingTitleView: UIView {
  private let sightingContainerStackView = UIStackView()
  
  private let authorImageView = UIImageView()
  
  private let sightingTitleVerticalStackView = UIStackView()
  private let sightingTitleLabel = UILabel()
  private let authorLabel = UILabel()
  
  private let padding: CGFloat = 20
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func update(with row: SightingsRow) {
    authorImageView.setImage(with: row.authorProfilePictureUrl,
                             placeholder: UIImage(systemName: "person.crop.circle.fill")?.tinted(with: .lightGray))
    if let user = row.entity.user {
      authorLabel.text = "author_name".localized("\(user.firstName) \(user.lastName)")
    }
    sightingTitleLabel.text = row.sightingName
  }
}

extension SightingTitleView {
  func setupViews() {
    setupSightingContainerStackView()
    setupAuthorImage()
    setupVerticalTitleStackView()
  }
  
  func setupSightingContainerStackView() {
    addSubview(sightingContainerStackView)
    
    sightingContainerStackView.axis = .horizontal
    sightingContainerStackView.alignment = .center
    sightingContainerStackView.spacing = 40
    sightingContainerStackView.backgroundColor = .white
    sightingContainerStackView.layoutMargins = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
    sightingContainerStackView.isLayoutMarginsRelativeArrangement = true
    sightingContainerStackView.snp.makeConstraints {
      $0.edges.equalToSuperview()
      $0.height.equalTo(80)
    }
  }
  
  func setupAuthorImage() {
    sightingContainerStackView.addArrangedSubview(authorImageView)
    authorImageView.kf.indicatorType = .activity
    authorImageView.contentMode = .scaleAspectFill
    authorImageView.layer.masksToBounds = false
    authorImageView.layer.cornerRadius = 20
    authorImageView.clipsToBounds = true
    authorImageView.tintColor = .gray
    authorImageView.snp.makeConstraints {
      $0.size.equalTo(40)
    }
  }
  
  func setupVerticalTitleStackView() {
    func setupAuthorLabel() {
      sightingTitleVerticalStackView.addArrangedSubview(authorLabel)
      
      authorLabel.textColor = .textScondary
      authorLabel.font = .custom(type: .italic, size: 12)
      authorLabel.textAlignment = .left
    }
    
    func setupSightingTitleLabel() {
      sightingTitleVerticalStackView.addArrangedSubview(sightingTitleLabel)
      
      sightingTitleLabel.textColor = .textPrimary
      sightingTitleLabel.font = .custom(type: .regular, size: 15)
      sightingTitleLabel.textAlignment = .left
    }
    
    sightingContainerStackView.addArrangedSubview(sightingTitleVerticalStackView)
    
    setupSightingTitleLabel()
    setupAuthorLabel()
    sightingTitleVerticalStackView.axis = .vertical
    sightingTitleVerticalStackView.spacing = 5
    sightingTitleVerticalStackView.alignment = .leading
  }
}
