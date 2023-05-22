//
//  ItemDimension.swift
//  FlowrSpot
//
//  Created by Toni Kocjan on 18/01/2018.
//  Copyright © 2022 Povio Inc. All rights reserved.
//

import UIKit

protocol ItemDimension {
  func sizeForItem(at indexPath: IndexPath) -> CGSize
}

protocol CollectionViewItemDimension {
  func sizeForItem(at indexPath: IndexPath, for collectionView: UICollectionView) -> CGSize
  
  var sectionInset: UIEdgeInsets { get }
  var lineSpacing: CGFloat { get }
  var interItemSpacing: CGFloat { get }
}
