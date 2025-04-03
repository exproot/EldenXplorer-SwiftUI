//
//  BossDetailCoordinator.swift
//  EldenXplorerSwiftUI
//
//  Created by Ertan Yağmur on 3.04.2025.
//

import SwiftUI

final class BossDetailCoordinator {

  func makeViewController(with boss: Boss) -> UIViewController {
    let viewModel = BossDetailViewModel(boss: boss)
    let view = BossDetailView(viewModel: viewModel)
    let hostingVC = UIHostingController(rootView: view)
    return hostingVC
  }

}
