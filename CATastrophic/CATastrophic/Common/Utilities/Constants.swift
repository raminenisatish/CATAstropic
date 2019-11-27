//
//  Constants.swift
//  CATastrophic
//
//  Created by raminenisatishbabu on 25/11/19.
//  Copyright © 2019 Satish Babu. All rights reserved.
//

import Foundation

enum RequestConstants {
  static let baseUrl = "https://api.thecatapi.com/v1/images/search?limit=20"
  
  enum API {
    static let page = "page"
    static let mimeType = "mime_types"
    static let limit = "limit"
  }
  enum mimeTypes {
    static let png = "png"
    static let jpg = "jpg"
  }
}

 enum APIServiceError: Error {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case decodeError
}
