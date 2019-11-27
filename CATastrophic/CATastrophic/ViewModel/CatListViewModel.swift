//
//  CatListViewModel.swift
//  CATastrophic
//
//  Created by raminenisatishbabu on 25/11/19.
//  Copyright © 2019 Satish Babu. All rights reserved.
//

import Foundation
class CatListViewModel: BaseViewModel {
  
  var requestStatusChanged: ((Bool) -> Void)?
  var requestEncounteredError: ((APIServiceError?) -> Void)?
  var requestSucceded: ((_ fetchCount: Int)-> Void)?
  lazy var catlist = [CatList]()
  private var pageToLoad = 1
  private var limit = 20
  
  func fetchCatList() {
    self.requestStatusChanged?(true)
    guard let url: URL = URL(string: RequestConstants.baseUrl) else {
      self.requestEncounteredError?(.invalidEndpoint)
      return
    }
    
    WebRequestManager.shared.requestCatLists(url: url, with: pageToLoad, mimeType: RequestConstants.mimeTypes.png, itemLimit:limit) { (result: Result<[CatList],APIServiceError>) in
      DispatchQueue.main.async {
        self.requestStatusChanged?(false)
        switch result {
        case .success(let response):
          self.pageToLoad += 1;
          self.catlist += response
          self.requestSucceded?(response.count)
          
        case .failure(let error):
          self.requestEncounteredError?(error)
        }
      }
    }
  }
}
