//
//  API.swift
//  EldenXplorerSwiftUI
//
//  Created by Ertan Yağmur on 3.04.2025.
//

import Foundation
import Moya

enum API {

  case bosses(limit: Int)

}

extension API: TargetType {

  var baseURL: URL {
    guard let url = URL(string: Constants.API.baseUrl) else {
      fatalError()
    }
    return url
  }

  var path: String {
    switch self {
    case .bosses:
      return Constants.API.bosses
    }
  }

  var method: Moya.Method {
    return .get
  }

  var task: Moya.Task {
    switch self {
    case .bosses(let limit):
      return .requestParameters(
        parameters: [
          "limit": limit
        ],
        encoding: URLEncoding.queryString)
    }
  }

  var headers: [String : String]? {
    return ["Content-Type": "application/json"]
  }

  var sampleData: Data {
    return Data()
  }
}
