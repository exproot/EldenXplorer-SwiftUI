//
//  AppConfigurer.swift
//  EldenXplorerSwiftUI
//
//  Created by Ertan Yağmur on 3.04.2025.
//

import DependencyContainer
import Foundation

enum AppConfigurer {

  private static var didConfigureDependencies = false

  static func configureDependencies() {
    guard didConfigureDependencies == false else {
      assertionFailure("")
      return
    }

    didConfigureDependencies = true

    DC.shared.register(type: .singleInstance(NetworkManager()), for: Networkable.self)

    DC.shared.register(type: .closureBased({
      let networkManager = DC.shared.resolve(type: .singleInstance, for: Networkable.self)

      return BossRepositoryImpl(networkManager: networkManager)
    }), for: BossRepository.self)

    DC.shared.register(type: .closureBased({
      let bossRepository = DC.shared.resolve(type: .closureBased, for: BossRepository.self)

      return FetchBossesUseCase(bossRepository: bossRepository)
    }), for: FetchBossesUseCaseProtocol.self)

  }

}
