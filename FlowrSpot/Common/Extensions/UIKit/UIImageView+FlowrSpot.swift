//
//  UIImageView+FlowrSpot.swift
//  FlowrSpot
//
//  Created by Borut Tomazin on 20/11/2020.
//  Copyright © 2022 Povio Inc. All rights reserved.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView {
  func setImage(with url: URL?, placeholder: UIImage? = nil) {
    kf.indicatorType = .activity
    kf.setImage(with: url, placeholder: placeholder)
  }
  
  func addGradient(startColor: UIColor, endColor: UIColor, opacity: Float) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = frame
    gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    gradientLayer.locations = [0.0, 1.0]
    gradientLayer.opacity = opacity
    layer.addSublayer(gradientLayer)
  }
}
