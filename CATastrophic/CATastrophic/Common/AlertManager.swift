//
//  AlertManager.swift
//  CATastrophic
//
//  Created by raminenisatishbabu on 25/11/19.
//  Copyright © 2019 Satish Babu. All rights reserved.
//

import Foundation
import UIKit
class AlertManager {
  
  class func AlertController(title: String, descriptions: String? ,alertStyle: UIAlertController.Style) -> UIAlertController {
    return UIAlertController(title: title, message: descriptions, preferredStyle: alertStyle)
  }
  
  class func showAlert(on viewController: UIViewController, withTitle: String, message: String?) {
    let alertController = AlertController(title: withTitle, descriptions: message, alertStyle: .alert)
    let alertOkAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(alertOkAction)
    viewController.present(alertController, animated: true, completion: nil)
  }
}
