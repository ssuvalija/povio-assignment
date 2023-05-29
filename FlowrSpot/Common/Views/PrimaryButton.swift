//
//  PrimaryButton.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 26/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import Foundation
import UIKit

class PrimaryButton: UIButton {
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupButtonStyle()
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

private extension PrimaryButton {
  private func setupButtonStyle() {
    layer.cornerRadius = 3
    clipsToBounds = true
    
    setTitleColor(.white, for: .normal)
    
    let size = self.bounds.size
    titleLabel?.font = .custom(type: .semibold, size: 14)
    setBackgroundImage(createGradientImage(colors: [UIColor.flowrPink, UIColor.flowrPinkLight], size: size), for: .normal)
    setBackgroundImage(UIColor.flowrPinkLight.withAlphaComponent(0.8).image(size), for: .highlighted)
  }
  
  func createGradientImage(colors: [UIColor], size: CGSize) -> UIImage? {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = CGRect(origin: .zero, size: size)
    gradientLayer.colors = colors.map { $0.cgColor }
    gradientLayer.locations = [0.0, 1.0]
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    guard let context = UIGraphicsGetCurrentContext() else {
      UIGraphicsEndImageContext()
      return nil
    }
    
    gradientLayer.render(in: context)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return image
  }
}
