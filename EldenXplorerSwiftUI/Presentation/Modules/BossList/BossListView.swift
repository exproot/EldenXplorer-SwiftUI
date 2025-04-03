//
//  BossListView.swift
//  EldenXplorerSwiftUI
//
//  Created by Ertan Yağmur on 3.04.2025.
//

import SwiftUI

struct BossListView: View {

  @StateObject var viewModel: BossListViewModel

  var body: some View {

    VStack {
      List(viewModel.bosses) { boss in
        Text(boss.name)
          .onTapGesture {
            viewModel.goToDetailsTapped(with: boss)
          }
      }
    }
    .navigationTitle("Bosses")
    .onAppear {
      viewModel.onAppear()
    }

  }
}

#Preview {
  BossListView(
    viewModel: BossListViewModel(
      fetchBossesUseCase: FetchBossesUseCase(
        bossRepository: BossRepositoryImpl(
          networkManager: NetworkManager())
      ),
      onGoToDetails: { _ in }))
}
