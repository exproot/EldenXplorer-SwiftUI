//
//  BossListViewModel.swift
//  EldenXplorerSwiftUI
//
//  Created by Ertan Yağmur on 3.04.2025.
//


import SwiftUI

final class BossListViewModel: ObservableObject {

  @Published var bosses: [Boss] = []

  private let fetchBossesUseCase: FetchBossesUseCaseProtocol

  private let onGoToDetails: (Boss) -> Void

  init(fetchBossesUseCase: FetchBossesUseCaseProtocol, onGoToDetails: @escaping (Boss) -> Void) {
    self.fetchBossesUseCase = fetchBossesUseCase
    self.onGoToDetails = onGoToDetails
  }

  func onAppear() {
    fetchBossesUseCase.execute(with: 10) { [weak self] result in
      switch result {
      case .success(let bosses):
        DispatchQueue.main.async {
          self?.bosses = bosses
        }

      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }

  func goToDetailsTapped(with boss: Boss) {
    onGoToDetails(boss)
  }

}
