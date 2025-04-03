//
//  BossListCoordinator.swift
//  EldenXplorerSwiftUI
//
//  Created by Ertan Yağmur on 3.04.2025.
//

import SwiftUI

final class BossListCoordinator {

  private weak var navigationController: UINavigationController?

  init(navigationController: UINavigationController?) {
    self.navigationController = navigationController
  }

  func makeViewController() -> UIViewController {
    let fetchBossesUseCase = DependencyContainer.shared.resolve(type: .closureBased, for: FetchBossesUseCaseProtocol.self)
    let viewModel = BossListViewModel(fetchBossesUseCase: fetchBossesUseCase, onGoToDetails: pushDetail)
    let view = BossListView(viewModel: viewModel)
    let hostingVC = UIHostingController(rootView: view)
    return hostingVC
  }

  func pushDetail(_ boss: Boss) {
    let detailCoordinator = BossDetailCoordinator()
    let detailVC = detailCoordinator.makeViewController(with: boss)

    navigationController?.present(detailVC, animated: true, completion: nil)
  }

}
