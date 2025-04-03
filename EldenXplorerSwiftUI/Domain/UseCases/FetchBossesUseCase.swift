//
//  FetchBossesUseCase.swift
//  EldenXplorerSwiftUI
//
//  Created by Ertan Yağmur on 4.04.2025.
//

import Foundation

protocol FetchBossesUseCaseProtocol {
  func execute(with limit: Int, completion: @escaping (Result<[Boss], Error>) -> Void)
}


final class FetchBossesUseCase {

  private let bossRepository: BossRepository

  init(bossRepository: BossRepository) {
    self.bossRepository = bossRepository
  }

}

extension FetchBossesUseCase: FetchBossesUseCaseProtocol {

  func execute(with limit: Int, completion: @escaping (Result<[Boss], Error>) -> Void) {
    bossRepository.fetchBosses(with: limit, completion: completion)
  }

}
