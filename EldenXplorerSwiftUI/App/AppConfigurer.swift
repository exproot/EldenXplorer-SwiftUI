//
//  AppConfigurer.swift
//  EldenXplorerSwiftUI
//
//  Created by Ertan Yağmur on 3.04.2025.
//


import Foundation

enum AppConfigurer {

  private static var didConfigureDependencies = false

  static func configureDependencies() {
    guard didConfigureDependencies == false else {
      assertionFailure("")
      return
    }

    didConfigureDependencies = true

    DependencyContainer.shared.register(type: .singleInstance(NetworkManager()), for: Networkable.self)

    DependencyContainer.shared.register(type: .closureBased({
      let networkManager = DependencyContainer.shared.resolve(type: .singleInstance, for: Networkable.self)

      return BossRepositoryImpl(networkManager: networkManager)
    }), for: BossRepository.self)

    DependencyContainer.shared.register(type: .closureBased({
      let bossRepository = DependencyContainer.shared.resolve(type: .closureBased, for: BossRepository.self)

      return FetchBossesUseCase(bossRepository: bossRepository)
    }), for: FetchBossesUseCaseProtocol.self)

  }

}
