//
//  UIButton+FlowrSpot.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 25/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import Foundation
import UIKit

struct ActionButtonConfiguration {
  let imageName: String
  var title: String?
  var titleColor: UIColor = .textScondary
  var highlightedTitleColor: UIColor = .darkGray
  var font: UIFont = .custom(type: .regular, size: 12)
  var buttonHeight: CGFloat = 15
  var backgroundColor: UIColor = .clear
  var cornerRadius: CGFloat = 0
}

extension UIButton {
  func configureAsActionButton(configuration: ActionButtonConfiguration) {
    setTitle(configuration.title, for: .normal)
    setImage(UIImage(named: configuration.imageName)?.withRenderingMode(.alwaysOriginal), for: .normal)
    
    let spacing: CGFloat = 10
    let imageSize = imageView?.frame.size ?? .zero
    
    imageEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: frame.size.width - (imageSize.width + 2 * spacing))
    titleEdgeInsets = UIEdgeInsets(top: 0, left: (imageSize.width + 2 * spacing), bottom: 0, right: spacing)
    
    contentHorizontalAlignment = .left
    
    titleLabel?.font = configuration.font

    setTitleColor(configuration.titleColor, for: .normal)
    setTitleColor(configuration.highlightedTitleColor, for: .highlighted)
    
    backgroundColor = configuration.backgroundColor
        
    if configuration.cornerRadius > 0 {
      layer.cornerRadius = configuration.cornerRadius
      layer.cornerCurve = .continuous
      layer.masksToBounds = true
    }
    
    snp.makeConstraints {
      $0.height.equalTo(configuration.buttonHeight)
    }
  }
}
