//
//  BaseFlowrSpotViewController.swift
//  FlowrSpot
//
//  Created by Selma Suvalija on 26/05/2023.
//  Copyright © 2023 Povio Inc. All rights reserved.
//

import UIKit

class BaseFlowrSpotViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let logoImageView = UIImageView(image: UIImage(named: "pl-logo"))
    navigationItem.titleView = logoImageView
  }
}
