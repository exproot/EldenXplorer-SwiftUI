//
//  NetworkManager.swift
//  EldenXplorerSwiftUI
//
//  Created by Ertan Yağmur on 3.04.2025.
//

import Foundation
import Moya

protocol Networkable {

  var provider: MoyaProvider<API> { get }

  func fetchBosses(with limit: Int, completion: @escaping (Result<BossResponseDTO, Error>) -> Void)

}

final class NetworkManager: Networkable {

  var provider = Moya.MoyaProvider<API>()

  func fetchBosses(with limit: Int, completion: @escaping (Result<BossResponseDTO, Error>) -> Void) {
    request(target: .bosses(limit: limit), completion: completion)
  }

}

extension NetworkManager {

  private func request<T: Decodable>(target: API, completion: @escaping (Result<T, Error>) -> Void) {
    provider.request(target) { result in
      switch result {
      case .success(let response):
        do {
          let results = try JSONDecoder().decode(T.self, from: response.data)

          completion(.success(results))

        } catch {
          completion(.failure(error))
        }

      case .failure(let error):
        completion(.failure(error))
      }
    }
  }

}
