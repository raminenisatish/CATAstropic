//
//  NibHandler.swift
//  CATastrophic
//
//  Created by raminenisatishbabu on 26/11/19.
//  Copyright © 2019 Satish Babu. All rights reserved.
//

import Foundation
import UIKit
enum NibFiles: String {
  case CatListCollectionViewCell
  
  var instance: UINib {
    return UINib(nibName: self.rawValue, bundle: Bundle.main)
  }
  
  func instantiateVC<T: UIViewController>(_ objectClass: T.Type) -> T? {
    if let vc = instance.instantiate(withOwner: nil, options: nil).first as? T {
      return vc
    }
    return nil
  }
}
