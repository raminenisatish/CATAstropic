//
//  BaseProtocol.swift
//  CATastrophic
//
//  Created by raminenisatishbabu on 25/11/19.
//  Copyright © 2019 Satish Babu. All rights reserved.
//

import Foundation

protocol BaseViewModel: class {
  
   // Used to update the request started/ended status. can be usewd to update the activity indicator.
  var requestStatusChanged: ((_ inProgress: Bool) -> Void)? { get set }
  
  // Used to inform about the error
  var requestEncounteredError: ((_ error: APIServiceError?) -> Void)? { get set }
  
}
