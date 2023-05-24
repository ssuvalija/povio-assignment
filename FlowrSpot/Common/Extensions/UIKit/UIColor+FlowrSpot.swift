//
//  UIColor+FlowrSpot.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 04/11/2017.
//  Copyright © 2022 Povio Inc. All rights reserved.
//

import PovioKit
import UIKit

extension UIColor {
  static let flowrGray = UIColor(red: 148, green: 158, blue: 160)
  static let flowrDarkGray = UIColor(red: 212, green: 216, blue: 217)
  static let flowrPink = UIColor(red: 223, green: 145, blue: 134)
  static let flowrPinkLight = UIColor(hexString: "#ECBCB3")
  
  static let textPrimary = UIColor(hexString: "#334144")
  static let textScondary = UIColor(hexString: "#949EA0")
  
  static let separatorGray = UIColor(hexString: "#E8E9ED")
  static let grayBackground = UIColor(hexString: "#F2F2F2")
  
  convenience init(hexString: String) {
    let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int = UInt64()
    Scanner(string: hex).scanHexInt64(&int)
    let aComponent, rComponent, gComponent, bComponent: UInt64
    switch hex.count {
    case 3: // RGB (12-bit)
      (aComponent, rComponent, gComponent, bComponent) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6: // RGB (24-bit)
      (aComponent, rComponent, gComponent, bComponent) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8: // ARGB (32-bit)
      (aComponent, rComponent, gComponent, bComponent) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
      (aComponent, rComponent, gComponent, bComponent) = (255, 0, 0, 0)
    }
    self.init(red: CGFloat(rComponent) / 255, green: CGFloat(gComponent) / 255, blue: CGFloat(bComponent) / 255, alpha: CGFloat(aComponent) / 255)
  }
  
  func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
    UIGraphicsImageRenderer(size: size).image { rendererContext in
      self.setFill()
      rendererContext.fill(CGRect(origin: .zero, size: size))
    }
  }
}
