//
//  BossRepositoryImpl.swift
//  EldenXplorerSwiftUI
//
//  Created by Ertan Yağmur on 4.04.2025.
//

import Foundation

final class BossRepositoryImpl {

  private let networkManager: Networkable

  init(networkManager: Networkable) {
    self.networkManager = networkManager
  }

}

extension BossRepositoryImpl: BossRepository {

  func fetchBosses(with limit: Int, completion: @escaping (Result<[Boss], Error>) -> Void) {
    networkManager.fetchBosses(with: limit) { result in
      switch result {
      case .success(let bossDTOs):
        let bosses = bossDTOs.data
          .compactMap { $0.toDomain() }

        completion(.success(bosses))

      case .failure(let error):
        completion(.failure(error))
      }
    }
  }

}

