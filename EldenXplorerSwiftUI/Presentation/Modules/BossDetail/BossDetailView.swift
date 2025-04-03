//
//  BossDetailView.swift
//  EldenXplorerSwiftUI
//
//  Created by Ertan Yağmur on 3.04.2025.
//

import SwiftUI

struct BossDetailView: View {

  @StateObject var viewModel: BossDetailViewModel

  var body: some View {
    VStack {
      Text(viewModel.boss.name)
    }
    .navigationTitle("Details")
  }
}

#Preview {
  BossDetailView(viewModel: BossDetailViewModel(boss: MockBoss.sampleBoss))
}
