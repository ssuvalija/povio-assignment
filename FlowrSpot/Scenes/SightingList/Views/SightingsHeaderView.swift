//
//  SightingsHeaderView.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 28/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import UIKit

final class SightingsHeaderView: UIView {
  let titleLabel = UILabel()
  let subtitleLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

private extension SightingsHeaderView {
  func setupViews() {
    backgroundColor = .grayBackground
    setupTitleLabel()
    setupSubtitleLabel()
  }
  
  func setupTitleLabel() {
    addSubview(titleLabel)
    titleLabel.text = "sightings_header_title".localized()
    titleLabel.textColor = .textScondary
    titleLabel.textAlignment = .center
    titleLabel.font = .custom(type: .regular, size: 24)
    
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().inset(24)
      $0.leading.trailing.equalToSuperview().inset(16)
      $0.height.equalTo(40)
    }
  }
  
  func setupSubtitleLabel() {
    addSubview(subtitleLabel)
    subtitleLabel.text = "sightings_header_subtitle".localized()
    subtitleLabel.textColor = .textScondary.withAlphaComponent(0.7)
    subtitleLabel.textAlignment = .center
    subtitleLabel.font = .custom(type: .regular, size: 12)
    
    subtitleLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(13)
      $0.leading.trailing.equalToSuperview().inset(16)
      $0.height.equalTo(17)
    }
  }
}
