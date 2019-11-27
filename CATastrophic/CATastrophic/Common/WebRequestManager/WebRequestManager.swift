//
//  WebRequestManager.swift
//  CATastrophic
//
//  Created by raminenisatishbabu on 25/11/19.
//  Copyright © 2019 Satish Babu. All rights reserved.
//

import Foundation
class  WebRequestManager {
  
  static let shared = WebRequestManager()

  private init(){}
  
  func requestCatLists<T: Decodable>(url: URL,with pageCount: Int,mimeType: String,itemLimit: Int, completion: @escaping (Result<T, APIServiceError>) -> Void) {
      guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
          completion(.failure(.invalidEndpoint))
          return
      }
    let queryItems = [URLQueryItem(name: RequestConstants.API.page, value: String(pageCount)),URLQueryItem(name: RequestConstants.API.mimeType, value: mimeType),URLQueryItem(name: RequestConstants.API.limit, value: String(itemLimit))]
      urlComponents.queryItems = queryItems
      guard let url = urlComponents.url else {
          completion(.failure(.invalidEndpoint))
          return
      }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
       
        guard let data = data, error == nil else {
            if let error = error as NSError?, error.domain == NSURLErrorDomain {
                    completion(.failure(.apiError))
            }
            return
        }
        
        do {
            let values = try JSONDecoder().decode(T.self, from: data)
            completion(.success(values))
        } catch {
            completion(.failure(.decodeError))
        }
    }.resume()
   
  }
  
}
