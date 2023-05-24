//
//  SightingsFooterView.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 28/25/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import UIKit

protocol SightingsFooterDelegate: AnyObject {
  func addNewSighting()
}

class SightingsFooterView: UIView {
  weak var delegate: SightingsFooterDelegate?
  
  private let addSightingButton = PrimaryButton(frame: CGRect(x: 0, y: 0, width: 200, height: 48))
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

private extension SightingsFooterView {
  func setupViews() {
    addSubview(addSightingButton)
    
    addSightingButton.setTitle("add_sighting_button_title".localized(), for: .normal)
    addSightingButton.addTarget(self, action: #selector(handleAddNewSightingTap), for: .touchUpInside)
    addSightingButton.snp.makeConstraints {
      $0.centerX.centerY.equalToSuperview()
    }
  }
  
  @objc func handleAddNewSightingTap() {
    delegate?.addNewSighting()
  }
}
