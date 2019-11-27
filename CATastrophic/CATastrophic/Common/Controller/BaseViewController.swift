//
//  BaseViewController.swift
//  CATastrophic
//
//  Created by raminenisatishbabu on 25/11/19.
//  Copyright © 2019 Satish Babu. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
  
  lazy var activityIndicator = UIActivityIndicatorView(style: .large)
  
  override func viewDidLoad() {
    super.viewDidLoad()
     setupActivityIndicator()
     setUpViewModelCallBacks()
  }
  
  // This method need to be overridden in child classes
  func viewModelObject() -> BaseViewModel? {
    return nil
  }
  
  // This method need to be overridden in child classes 
  func setUpViewModelCallBacks() {
    self.viewModelObject()?.requestStatusChanged = {[weak self] inProgress in
      inProgress ? self?.startActivityIndicator() : self?.stopActivityIndicator()
    }
  }
  
  fileprivate func setupActivityIndicator() {
    activityIndicator.color = .white
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    activityIndicator.isHidden = true
    activityIndicator.hidesWhenStopped = true
    view.addSubview(activityIndicator)
    
    NSLayoutConstraint.activate([
      activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
      ])
  }
  
  func startActivityIndicator() {
    activityIndicator.startAnimating()
  }
  
  func stopActivityIndicator() {
    activityIndicator.stopAnimating()
  }
  
  public func showAlertWith(error: Error?) {
     if error == nil {
       return
     }
     
     else {
       AlertManager.showAlert(on: self, withTitle: error?.localizedDescription ?? "", message: nil)
     }
   }
}
