//
//  CollectionViewCell+Additions.swift
//  CATastrophic
//
//  Created by raminenisatishbabu on 26/11/19.
//  Copyright © 2019 Satish Babu. All rights reserved.
//

import Foundation
import UIKit
extension UICollectionReusableView {
  
  class var identifier: String {
    return NSStringFromClass(self).components(separatedBy: ".").last!
  }
  
}
